<?php 

    /**
    * 
    */
    class EmailTemplate {

        private $template = "";
        private $templateHTML = "";
        private $name = "";
        private $email = "";
        private $total = "";
        private $productos = null;
        
        function __construct($name, $email, $productos = array(), $total)
        {
            $this->name = $name;
            $this->email = $email;
            $this->total = $total;
            $this->productos = $productos;

            if (!is_array($productos)) {
                $this->productos = array();
            }

            $this->generateEmail();
        }

        private function generateEmail()
        {
            $this->template = "Hola $this->name,\n
                \n
                Para concretar la compra de:\n
                Producto\t Cantidad\t Precio\n";

                
            
            $this->templateHTML = '<html><head></head><body>

                <div style="width: 550px;margin: 0 auto;padding-bottom: 10px"></div>

                <div style="width: 540px;margin: 0 auto 20px auto;border: 1px solid #EEE;border-bottom: 4px solid #EEE;padding: 25px 5px 20px 5px;
                            color: #444444;">
                    <div style="width: 480px; margin: 0 auto 20px auto;">

                        <p> Hola '  . $this->name . '</p>
                            <p><b>Para concretar la compra de:</b></p>
                        <div style="margin-left:12px;
                                    margin-right: 12px">
                            <div style="padding-bottom: 1px">
                                <table width="100%">';

                    foreach ($this->productos as $value) {

                        $this->templateHTML .= '
                        <tr>
                            <td>' . $value['nombre'] . '</td>
                            <td style="text-align:center">' . $value['cantidad'] . '</td>
                            <td style="text-align:center">' . $value['precio'] . '</td>
                        </tr>';

                        $this->template .= $value['nombre'] . " \t " . $value['cantidad'] ."\t " . $value['precio'] . "\n";

                    }
                    
                 $this->templateHTML .= '</table>
                        </div><br>
                        <div style="text-align:right;
                                    border-top: 1px solid #BBB;
                                    padding-top: 8px;
                                    padding-right: 3px"><b>Total: $' . $this->total . ' MXN</b></div>

                    </div>
                    <p><b>Comun&iacute;cate con nosotros:</b></p>
                    <div style="margin-left:12px">
                        Email: hola@mialacena.mx<br>
                        Celular: 9993 38 86 91
                    </div><br>
                    <p>MiAlacena.mx</p>

                </div>

            </div>

            </body>
            </html>';

            $this->template .= "\nTotal: $".$this->total." MXN\n
                \n
                Comunícate con nosotros:\n
                Email: hola@mialacena.mx\n
                Celular: 9993 38 86 91\n
                \n
                MiAlacena.mx";
        }

        public function getEmailHTML()
        {
            return $this->templateHTML;
        }

        public function getEmail()
        {
            return $this->template;
        }
    }

 ?>
