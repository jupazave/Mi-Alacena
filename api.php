<?php

require_once("class.rest.php");
require_once("class.mysql.php");

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
                sprintf("SELECT nombre, precio, imagen FROM productos where estado = '%s' and hidden = 0",
                    mysql_real_escape_string($estado)
                    ));

            // print_r($query);

            if ($query) {
                if (is_bool($query)) {

                    $error = array('status' => false, "msg" => "No results" , "more" => $insert);

                    $this->response($this->json($error), 200);

                }else{

                    $productos = array();

                    foreach ($query as $key => $value) {

                        if (!isset($value["imagen"])) {
                            $value["imagen"] = "";
                        }

                        $productos[] = array(
                            "nombre"=>utf8_encode($value["nombre"]), 
                            "precio" =>$value["precio"],
                            "imagen" =>$value["imagen"]);
                            
                    }

                    $results = array('status' => true, "data" => $productos, "more" => $insert);

                    $this->response($this->json($results), 200);

                }
            }
        }


        $this->response('',204); // If no records "No Content" status
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