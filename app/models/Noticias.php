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
 * Modelo Noticias
 *
 * @author Felipe Andrade V. <jjara@wys.cl>
 */

class Noticias extends Models implements IModels {
  /**
   * Característica para establecer conexión con base de datos.
   */
  use DBModel;

    // Contenido del modelo...

    public function crear_noticia() : array {
        try {
          global $http;

          # Obtener los datos $_POST
          $titulo = $http->request->get('titulo');
          $dcorta = $http->request->get('dcorta');
          $dlarga = $http->request->get('dlarga');
          $importancia = $http->request->get('importancia');
          $ori = $http->request->get('ori');

          if ($this->functions->e($titulo, $dcorta, $dlarga)) {
              throw new ModelsException('Todos los datos son necesarios');
          }
          $this->db->insert('tbl_noticias_blog',array(
            'titulo' => $titulo,
            'dcorta' => $dcorta,
            'dlarga' => $dlarga,
            'estatus' => $importancia,
            'origen' => $ori
          ));
          //
          return array('success' => 1, 'message' => $titulo);
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
    public function vernoticias(string $select = '*'){
    return $this->db->select($select,'tbl_noticias_blog');
    }
}
