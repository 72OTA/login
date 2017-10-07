<?php

/*
 * This file is part of the Ocrend Framewok 2 package.
 *
 * (c) Ocrend Software <info@ocrend.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
*/

use app\models as Model;

/**
    * Inicio de sesión
    *
    * @return json
*/
$app->post('/login', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->login());
});

/**
    * Modifica password usuario
    *
    * @return json
*/
$app->post('/resetpass', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->resetpass());
});

/**
    * Inicio de sesión
    *
    * @return json
*/
$app->post('/logout', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->logout());
});

/**
    * Registro de un usuario
    *
    * @return json
*/
$app->post('/registra_nuevo_usuario', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->registra_nuevo_usuario());
});
/**
    * Registro de un usuario
    *
    * @return json
*/
$app->post('/update_usuario', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->update_usuario());
});
/**
    * Recuperar contraseña perdida
    *
    * @return json
*/
$app->post('/lostpass', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->lostpass());
});

/**
    * Recuperar contraseña perdida
    *
    * @return json
*/
$app->post('/registra_nuevo_perfil', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->registra_nuevo_perfil());
});
/**
    * Elimina perfil seleccionado
    *
    * @return json
*/
$app->post('/delete_perfil', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->delete_perfil());
});
/**
    * Elimina perfil seleccionado
    *
    * @return json
*/
$app->post('/reset_pass_user', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->resetpass());
});
/**
    * Actualiza perfil de usuario modificado directamente
    *
    * @return json
*/
$app->post('/update_peril_usuario', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->update_peril_usuario());
});
/**
    * Actualiza perfil de usuario modificado directamente
    *
    * @return json
*/
$app->post('/mostar_datos_perfil', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->mostar_datos_perfil());
});
/**
    * Actualiza perfil de usuario modificado directamente
    *
    * @return json
*/
$app->post('/update_perfil', function() use($app) {
    $u = new Model\Users;

    return $app->json($u->update_perfil());
});
$app->post('/update_empresa', function() use($app) {
    $e = new Model\Empresa;

    return $app->json($e->update_empresa());
});
