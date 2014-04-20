<?php
define("COMISION", "1.333333333333");

require_once("./libs/MySQL/class.mysql.php");
require_once("./libs/REST/class.rest.php");


require_once("./libs/EmailTemplate.php");


require './libs/PHPMailer/PHPMailerAutoload.php';

// include ("helpers.php");



class API extends REST {

    public $data = "";

    const DB_SERVER = "productosdb.db.11310618.hostedresource.com";
    const DB_USER = "productosdb";
    const DB_PASSWORD = "Abeja2014!";
    const DB_PORT = 3306;
    const DB = "productosdb";

    private $db = NULL;

    public function __construct()
    {
        parent::__construct();// Init parent contructor
        $this->dbConnect();// Initiate Database connection
        //hola
    }

    //Database connection
    private function dbConnect()
    {
        $this->db = new MySQL(self::DB, self::DB_USER, self::DB_PASSWORD,self::DB_SERVER, self::DB_PORT);

    }

    private function getEstados(){ 
        // Cross validation if the request method is GET else it will return "Not Acceptable" status
        if($this->get_request_method() != "POST"){
            $this->response('',406);
        }

        $query = $this->db->ExecuteSQL(
            "SELECT nombre FROM estados");

        if ($query) {
            if (is_bool($query)) {

                $error = array('status' => false, "msg" => "No results");

                $this->response($this->json($error), 400);

            }else{

                $estados = array();

                foreach ($query as $key => $value) {

                    $estados[] = utf8_encode($value["nombre"]);
                        
                }

                $results = array('status' => true, "data" => $estados);

                $this->response($this->json($results), 200);

            }
        }


        $this->response('',204); // If no records "No Content" status
    }

    private function getProductos(){ 
        // Cross validation if the request method is GET else it will return "Not Acceptable" status
        if($this->get_request_method() != "POST"){
            $this->response('',406);
        }

        if (!isset($this->_request['estado'])) {
            $estado = NULL;
        }else{
            $estado = $this->_request['estado'];
        }

        if (is_null($estado)) {
            $error = array('status' => false, "msg" => "No access");

            $this->response($this->json($error), 404);
        }else{

            $insert = null;

            if ($estado != "31") {

                $data = array('datetime' => date("Y-m-d H:i:s"), 'ip' => $_SERVER['REMOTE_ADDR'], "idEstado" => $estado);

                $insert =  $this->db->Insert($data,"consultaEstado");

            }

            
            $query = $this->db->ExecuteSQL(
                sprintf("SELECT id, nombre, (precio)*" . COMISION ." as precio, imagen FROM productos where estado = '%s' and hidden = 0 And precio != 0",
                    mysql_real_escape_string($estado)
                    ));

            // print_r($query);

            if ($query) {
                if (is_bool($query)) {

                    $error = array('status' => false, "msg" => "No results" , "more" => $insert);

                    $this->response($this->json($error), 200);

                }else{

                    $productos = array();

                    // print_r($query);

                    foreach ($query as $key => $value) {

                        // print_r($value);

                        if (!isset($value["imagen"])) {
                            $value["imagen"] = "";
                        }

                        $productos[] = array(
                            "nombre"=>utf8_encode($value["nombre"]), 
                            "precio" =>ceil ( $value["precio"]),
                            "id" =>$value["id"],
                            "imagen" =>$value["imagen"]);
                            
                    }

                    $results = array('status' => true, "data" => $productos, "more" => $insert);

                    $this->response($this->json($results), 200);

                }
            }
        }


        $this->response('',204); // If no records "No Content" status
    }

    public function pedidos()
    {
        if($this->get_request_method() != "POST"){
            $this->response('',406);
        }

        if (!isset($this->_request['name'])) {
            $name = NULL;
        }else{
            $name = $this->_request['name'];
        }

        if (!isset($this->_request['productos'])) {
            $productos = NULL;
        }else{
            $productos = json_decode($this->_request['productos']);
        }

        if (!isset($this->_request['email'])) {
            $email = NULL;
        }else{
            $email = $this->_request['email'];
        }

        $error = false;
        $errores = array();

        if (is_null($name) OR $name == "" OR $name == "") {

            $error = true;

            $errores[] = "name";
            
        }

        if (is_null($email) OR $email == "" OR $email == "" OR !(filter_var($email, FILTER_VALIDATE_EMAIL))) {

            $error = true;

            $errores[] = "email";
            
        }

        if ($error) {

            $results = array('status' => false, "errores" => $errores);


            $this->response($this->json($results), 200);
        }


        // print_r($productos);

        $productos_coma = "";
        $cantidades_coma = "";
        $productos_id = array();
        $productos_y_cantidades = array();


        foreach ($productos as $value) {
            $productos_id[] = array('id' => $value->id);
            $productos_y_cantidades[$value->id] = $value->cantidad;
            $productos_coma .= $value->id . ",";
            $cantidades_coma .= $value->cantidad . ",";
        }

        $productos_coma = substr($productos_coma, 0, -1);
        $cantidades_coma = substr($cantidades_coma, 0, -1);

        $data = array('datetime' => date("Y-m-d H:i:s"), 
            'ip' => $_SERVER['REMOTE_ADDR'], 
            "nombre" => $name , 
            "email" => $email , 
            "idProductos" => $productos_coma,
            "cantidadesProductos"=>$cantidades_coma);

        

        $query =$this->db->Select("productos" , $productos_id, '', "", false, 'OR','id, nombre, (precio)*' . COMISION .' as precio');

        $productos_email = array();

        $total = 0;

        if (isset($query['id'])) {

            // $productos_email[]["nombre"] = $item["nombre"];
            $precio = ceil ( $query["precio"] ) * $productos_y_cantidades[$query["id"]];

            $add = array('nombre' => utf8_encode($query["nombre"]), "precio" => "$".$precio." MXN", "cantidad" => $productos_y_cantidades[$query["id"]]);

            $productos_email[] =  $add;
                
            $total += $precio;

        }else{

            foreach ($query as $item) {

                // $productos_email[]["nombre"] = $item["nombre"];
                $precio = ceil ( $item["precio"] ) * $productos_y_cantidades[$item["id"]];

                $add = array('nombre' => utf8_encode($item["nombre"]), "precio" => "$".$precio." MXN", "cantidad" => $productos_y_cantidades[$item["id"]]);

                $productos_email[] =  $add;
                
                $total += $precio;

            }

        }


        // $total = ceil ( $total  );


        // print_r($productos_email);

        $template = new EmailTemplate($name, $email, $productos_email, $total); 
        

            
        $mail = new PHPMailer;
        $ownMail = new PHPMailer;

        $mail->IsSMTP(); // Using SMTP.
        $mail->CharSet = 'utf-8';
        // $mail->SMTPDebug = 2; // Enables SMTP debug information - SHOULD NOT be active on production servers!
        $mail->SMTPAuth = false; // Enables SMTP authentication.
        $mail->Host = "relay-hosting.secureserver.net"; // SMTP server host.

        $mail->AddReplyTo('hola@mialacena.mx','MiAlacena.mx');
        $mail->SetFrom('hola@mialacena.mx','MiAlacena.mx');

        $mail->From = 'hola@mialacena.mx';
        $mail->FromName = 'MiAlacena.mx';
        $mail->addAddress($email, $name);  // Add a recipient
        $mail->addBCC('novelo_novelo@hotmail.com');
        $mail->addBCC('hola@mialacena.mx');
        $mail->addBCC('jegs87@gmail.com');
        $mail->addBCC('jupazave@gmail.com');

        $mail->WordWrap = 50;                                 // Set word wrap to 50 characters
        $mail->isHTML(true);                                  // Set email format to HTML

        $mail->Subject = 'Datos para concretar tu compra';
        $mail->Body    = $template->getEmailHTML();
        $mail->AltBody = $template->getEmail();

        if(!$mail->send()) {

            $data["enviado"]  = 0;

            $insert =  $this->db->Insert($data,"pedidos");

            $results = array('status' => false, "errores" =>array("mail"), "more" => $insert);

        }else{

            $data["enviado"]  = 1;

            $insert =  $this->db->Insert($data,"pedidos");

            $results = array('status' => true, "more" => $insert);

        }

        $this->response($this->json($results), 200);

    }

    //Public method for access api.
    //This method dynmically call the method based on the query string
    public function processApi()
    {
        // print_r($_REQUEST);
        $func = strtolower(trim(str_replace("/","",$_REQUEST['rquest'])));
        if((int)method_exists($this,$func) > 0)
            $this->$func();
        else
            $this->response('',404);
        // If the method not exist with in this class, response would be "Page not found".
    }


    //Encode array into JSON
    private function json($data)
    {
        if(is_array($data)){
            return json_encode($data);
        }
    }
}

// Initiiate Library
$api = new API;
$api->processApi();
?>
