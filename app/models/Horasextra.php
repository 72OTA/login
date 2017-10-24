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

/**
 * Modelo Horasextra
 *
 * @author Felipe Andrade V. <jjara@wys.cl>
 */

class Horasextra extends Models implements IModels {
  /**
   * Característica para establecer conexión con base de datos.
   */
  use DBModel;

    // Contenido del modelo...

    public function hora_extra() : array {
        try {
          global $http;

          # Obtener los datos $_POST
          $rut = $http->request->get('rut');
          $fecha = $http->request->get('fecha');
          $fechad = $http->request->get('fechad');
          $fechah = $http->request->get('fechah');
          $solicitante = $http->request->get('solicitante');
          $motivo = $http->request->get('motivo');


          if ($this->functions->e($motivo, $fechad, $fechah)) {
              throw new ModelsException('Todos los datos son necesarios');
          }
          $this->db->insert('tbl_horasextra',array(
            'rut' => $rut,
            'fecha'=> $fecha,
            'fechad' => $fechad,
            'fechah' => $fechah,
            'solicitante' => $solicitante,
            'motivo' => $motivo
          ));
          //
          return array('success' => 1, 'message' => 'Peticion de horas extra exitosa');
      } catch (ModelsException $e) {
          return array('success' => 0, 'message' => $e->getMessage());
      }
    }
    public function modificar(): array {
    try {
      global $http;


      #Obtener los datos $_POST
      $fecha = $http->request->get('fecha');
      $fechad = $http->request->get('fechad');
      $fechah = $http->request->get('fechah');
      $motivo = $http->request->get('motivo');
      $id = $http->request->get('id');


      if ($this->functions->e($motivo, $fechad, $fechah)) {
          throw new ModelsException('Todos los datos son necesarios');
      }
      $this->db->update('tbl_horasextra',array(
        'fecha'=> $fecha,
        'fechad' => $fechad,
        'fechah' => $fechah,
        'motivo' => $motivo
      ),"id='$id'",'LIMIT 1');
      //
      return array('success' => 1, 'message' => 'Modificacion de horas extra exitosa');
    }catch (ModelsException $e) {
        return array('success' => 0, 'message' => $e->getMessage());
    }
  }
  public function aprobar(): array {
  try {
    global $http;


    #Obtener los datos $_POST
    $aprobar = "Aprobada";
    $motivo = $http->request->get('motivo_respuesta');
    $id = $http->request->get('id_respuesta');


    if ($this->functions->e($motivo)) {
        throw new ModelsException('Ingrese un motivo');
    }
    $this->db->update('tbl_horasextra',array(
      'estatus' => $aprobar,
      'motivo' => $motivo
    ),"id='$id'",'LIMIT 1');
    //
    return array('success' => 1, 'message' => 'Modificacion de horas extra exitosa');
  }catch (ModelsException $e) {
      return array('success' => 0, 'message' => $e->getMessage());
  }
  }
  public function rechazar(): array {
  try {
    global $http;


    #Obtener los datos $_POST
    $aprobar = "Rechazada";
    $motivo = $http->request->get('motivo_respuesta');
    $id = $http->request->get('id_respuesta');


    if ($this->functions->e($motivo)) {
        throw new ModelsException('Ingrese un motivo');
    }
    $this->db->update('tbl_horasextra',array(
      'estatus' => $aprobar,
      'motivo' => $motivo
    ),"id='$id'",'LIMIT 1');
    //
    return array('success' => 1, 'message' => 'Modificacion de horas extra exitosa');
  }catch (ModelsException $e) {
      return array('success' => 0, 'message' => $e->getMessage());
  }
  }
  public function eliminar() : array {
      try {
          global $http;

          # Obtener los datos $_POST
          $id = $http->request->get('id_solicitudhx');

          # Elimina perfil
          $this->db->delete('tbl_horasextra',"id='$id'"," LIMIT 1");

          //return array('success' => 1, 'message' => 'Eliminación éxitosa.');
          return array('success' => 1, 'message' => 'Eliminación éxitosa.');
      } catch (ModelsException $e) {
          return array('success' => 0, 'message' => $e->getMessage());
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
    public function gethx(string $select = '*',string $condicion = '1=1'){
      if ($select === '*')
      {
        return $this->db->select($select,'tbl_horasextra',$condicion,'ORDER BY id DESC');
      }else{
        return $this->db->select($select,'tbl_horasextra',$condicion,'LIMIT 1');
      }
    }
    public function gethxid(int $id,string $select = '*'){
      return $this->db->select($select,'tbl_horasextra',"id='$id'",'LIMIT 1');
    }
}
