<?php

/*
 * This file is part of the Ocrend Framewok 2 package.
 *
 * (c) Ocrend Software <info@ocrend.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
*/

namespace app\controllers;

use app\models as Model;
use Ocrend\Kernel\Router\IRouter;
use Ocrend\Kernel\Controllers\Controllers;
use Ocrend\Kernel\Controllers\IControllers;

/**
 * Controlador administracion/
 *
 * @author Jorge Jara H. <jjara@wys.cl>
*/

class administracionController extends Controllers implements IControllers {

    public function __construct(IRouter $router) {
        parent::__construct($router,array(
            'users_logged' => true
        ));
        global $config;


        if ($this->user['rol'] == 1){
          $u = new Model\Users($router);
          $op = array(99);
          switch($this->method){
            case 'perfiles':
              echo $this->template->render('administracion/perfiles', array(
                'menu_op' => $op,
                'db_perfiles' => $u->getPerfiles(),
                'db_users' => $u->getUsers('*','rol=0 and estado=1') ));
                break;
            case 'usuario':
              echo $this->template->render('administracion/listado_usuarios', array(
                'menu_op' => $op,
                'db_users' => $u->getUsers('*','1=1') ));
                break;
            case 'registro_user': echo $this->template->render('administracion/usuarios', array(
              'menu_op' => $op,
              'db_perfiles' => $u->getPerfiles() ));
              break;
            case 'editar_user':
              if($this->isset_id and false !== ($data = $u->getUserById($router->getId()))) {
                echo $this->template->render('administracion/edit_user', array(
                  'menu_op' => $op,
                  'db_users' => $data[0],
                  'db_perfiles' => $u->getPerfiles()
                ));
              } else {
                $this->functions->redir($config['site']['url'] . 'administracion/&error=true');
              }
              break;
            case "estado_user":
                $u->update_estado_user();
                break;
            default:
              echo $this->template->render('error/error_portal',array('menu_op' => $op ));
              break;
          }
        }else{
          $op = array(0);
          echo $this->template->render('error/error_nopermitido',array('menu_op' => $op ));
        }


    }

}
