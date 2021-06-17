<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use App\Form\CategoriesType;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/admin/categories")
 */
class CategoriesController extends AbstractController
{
    /**
     * @Route("/", name="admin_categories_index", methods="GET")
     */
    public function index(CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findAll();
        return $this->render('admin/categories/index.html.twig', [
            'categories' => $categories
        ]);
    }

    /**
     * @Route("/new", name="admin_categories_new", methods="GET|POST")
     */
    public function new(Request $request): Response
    {
        $category = new Category();
        $form = $this->createForm(CategoriesType::class,$category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($category);
            $em->flush();
            $this->addFlash('ekle','');
            return $this->redirectToRoute('admin_categories_index');
        }

        return $this->render('admin/categories/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("/{id}/edit", name="admin_categories_edit", methods="GET|POST")
     */
    public function edit(Request $request, Category $category): Response
    {
        $form = $this->createForm(CategoriesType::class,$category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();
            $this->addFlash('guncelle','');
            return $this->redirectToRoute('admin_categories_index');
        }

        return $this->render('admin/categories/edit.html.twig', [
            'category' => $category,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="admin_categories_delete", methods="DELETE")
     */
    public function delete(Request $request, Category $category): Response
    {
        if ($this->isCsrfTokenValid('delete'.$category->getId(), $request->request->get('_token'))) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($category);
            $this->addFlash('sil','');
            $em->flush();
        }

        return $this->redirectToRoute('admin_categories_index');
    }
}