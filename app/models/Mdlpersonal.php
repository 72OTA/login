<?php

/*
 * This file is part of the Ocrend Framewok 2 package.
 *
 * (c) Ocrend Software <info@ocrend.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace app\models;

use app\models as Model;
use Ocrend\Kernel\Models\Models;
use Ocrend\Kernel\Models\IModels;
use Ocrend\Kernel\Models\ModelsException;
use Ocrend\Kernel\Models\Traits\DBModel;
use Ocrend\Kernel\Router\IRouter;
use Ocrend\Kernel\Helpers\Strings;

/**
 * Modelo Mdlpersonal
 *
 * @author Jorge Jara H. <jjara@wys.cl>
 */

class Mdlpersonal extends Models implements IModels {
    /**
      * Característica para establecer conexión con base de datos.
    */
    use DBModel;

    // Contenido del modelo...


		/**
      * Obtiene elementos de Mdlpersonal en tblpersonal
      *
      * @param string $select: Elementos de tblpersonal a seleccionar
      *
      * @return false|array: false si no hay datos.
      *                     array con los datos.
    */
    final public function get(string $select = '*') {
      return $this->db->select($select,'tblpersonal');
    }
    final public function getTrabajadorById(int $id, string $select = '*') {
        return $this->db->select($select,'tblpersonal',"id_personal='$id'",'LIMIT 1');
    }
    final public function getPersonalAll($filtro = '1=1') {
      $filtro = 'where '.$filtro;
      return $this->db->query('select p.id_personal,rut,nombres,f_nacimiento,fono,p.id_cargo,c.descripcion desc_cargo,p.id_area,a.descripcion desc_area,estado from ((tblpersonal p inner join tblcargos c on p.id_cargo=c.id_cargo) inner join tblareas a on p.id_area=a.id_area)'.$filtro);
    }
    final public function getCargos(string $select = '*') {
      return $this->db->select($select,'tblcargos');
    }
    final public function getAreas(string $select = '*') {
      return $this->db->select($select,'tblareas');
    }


    /**
     * Realiza la acción de registro dentro del sistema
     *
     * @return array : Con información de éxito/falla al registrar el usuario nuevo.
     */
    public function registra_nuevo_trabajador() : array {
        try {
            global $http;

            # Obtener los datos $_POST
            $name = $http->request->get('nombres');
            $rut = $http->request->get('rut');
            $fono = $http->request->get('fono');
            $id_cargo = $http->request->get('cargo');
            $id_area = $http->request->get('area');
            $f_nacimiento = $http->request->get('f_nacimiento');

            # Verificar que no están vacíos
            if ($this->functions->e($rut, $name)) {
                throw new ModelsException('Ingresar datos donde campos se especifica como Requerido');
            }elseif ($id_cargo == '--'){
              throw new ModelsException('Debe asignar un cargo valido');
            }elseif ($id_area == '--'){
              throw new ModelsException('Debe asignar un area valida');
            }

            # Verificar Rut
            $this->checkRut($rut);

            # Registrar al usuario
            $this->db->insert('tblpersonal', array(
                'rut' => $rut,
                'nombres' => $name,
                'fono' => $fono,
                'id_cargo' => $id_cargo,
                'id_area' => $id_area,
                'f_nacimiento' => $f_nacimiento
            ));

            return array('success' => 1, 'message' => 'Registrado con éxito.');
        } catch (ModelsException $e) {
            return array('success' => 0, 'message' => $e->getMessage());
        }
    }


    /**
      * Actualiza estado de usuario
      * y luego redirecciona a administracion/usuarios
      *
      * @return void
    */
    final public function update_estado_trabajador($id) {
        global $config;

        # Actualiza Estado
        $this->db->query("UPDATE tblpersonal SET estado=if(estado=0,1,0) WHERE id_personal=$id LIMIT 1;");


        # Redireccionar a la página principal del controlador
        $this->functions->redir($config['site']['url'] . 'rrhh/listar_trabajadores');
    }

    /**
     * Verifica el rut introducido, tanto el formato como su existencia en el sistema
     *
     * @param string $rut: Rut del trabajador
     *
     */
    private function checkRut(string $rut) {
        # Existencia de email
        $rut = $this->db->scape($rut);
        $query = $this->db->select('rut', 'tblpersonal', "rut='$rut'", 'LIMIT 1');
        if (false !== $query) {
            throw new ModelsException('El Rut introducido ya existe.');
        }
    }

    /**
      * __construct()
    */
    public function __construct(IRouter $router = null) {
        parent::__construct($router);
        $this->startDBConexion();
    }

    /**
      * __destruct()
    */
    public function __destruct() {
        parent::__destruct();
        $this->endDBConexion();
    }
}
