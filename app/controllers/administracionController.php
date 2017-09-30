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
        $u = new Model\Users($router);



        $op = array(99);
        switch($this->method){
            case 'perfiles': echo $this->template->render('administracion/perfiles', array('menu_op' => $op, 'db_perfiles' => $u->getPerfiles(),'db_users' => $u->getUsers('*','admin=0 and estado=1') )); break;
            case 'usuario': echo $this->template->render('administracion/usuarios', array('menu_op' => $op, 'db_perfiles' => $u->getPerfiles() )); break;
            default:
                echo $this->template->render('error/error_portal',array('menu_op' => $op ));
                break;
        }


    }

}
