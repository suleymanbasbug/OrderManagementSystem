<?php

namespace App\Controller\Admin;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class HomeController extends AbstractController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index()
    {

        return $this->render('admin/home/index.html.twig', [

        ]);

    }
    /**
     * @Route("/admin/orders/{slug}", name="admin_orders_index")
     */
    public function orders($slug)
    {

        return $this->render('admin/orders/index.html.twig', [
        ]);
    }
    /**
     * @Route("/admin/orders/show/{id}", name="admin_orders_show", methods="GET")
     */
    public function show():Response
    {

        return $this->render('admin/orders/show.html.twig', [
        ]);
    }
    /**
     * @Route("/admin/orders/{id}/update", name="admin_orders_update", methods="POST")
     */
    public function order_update():Response
    {



        return $this->redirectToRoute('admin_orders_show', array());
    }




    /**
     * @Route("/admin/user/succes/{id}", name="admin_user_succes",methods="GET|POST")
     */
    public function succes($id)
    {
        return $this->redirectToRoute('admin');
    }
    /**
     * @Route("/admin/user/deletesucces/{id}", name="admin_user_deletesucces",methods="GET|POST")
     */
    public function deletesucces()
    {

    }
}