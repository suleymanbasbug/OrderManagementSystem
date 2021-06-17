<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/product")
 */
class ProductController extends AbstractController
{
    /**
     * @Route("/", name="admin_product_index", methods="GET")
     */
    public function index(ProductRepository $productRepository, CategoryRepository $categoryRepository): Response
    {
        $catlistt = $categoryRepository->findAll();
        $products = $productRepository->findAll();
        return $this->render('admin/product/index.html.twig', [
            'catlist'=>$catlistt,
            'products' => $products,
        ]);
    }

    /**
     * @Route("/new", name="admin_product_new", methods="GET|POST")
     */
    public function new(Request $request ,CategoryRepository $categoryRepository): Response
    {
        $categories=$categoryRepository->findAll();

        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($product);
            $em->flush();
            $this->addFlash('ekle','');
            return $this->redirectToRoute('admin_product_index');
        }

        return $this->render('admin/product/new.html.twig', [
            'product' => $product,
            'categories' => $categories,
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("/{id}/edit", name="admin_product_edit", methods="GET|POST")
     */
    public function edit(Request $request, Product $product,CategoryRepository $categoryRepository): Response
    {

        $catlist=$categoryRepository->findAll();


        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('guncelle','');
            return $this->redirectToRoute('admin_product_index', ['id' => $product->getId()]);
        }

        return $this->render('admin/product/edit.html.twig', [
            'product' => $product,
            'catlist' => $catlist,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_product_delete", methods="DELETE")
     */
    public function delete(Request $request, Product $product): Response
    {
        if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($product);
            $em->flush();
            $this->addFlash('sil','');
        }

        return $this->redirectToRoute('admin_product_index');
    }

}