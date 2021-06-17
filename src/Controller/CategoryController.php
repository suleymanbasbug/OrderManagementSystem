<?php

namespace App\Controller;

use App\Entity\Category;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
    /**
     * @Route("/category/{id}", name="category.detail")
     */
    public function index(Category $category,CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findAll();
        $category = $this->getDoctrine()->getRepository(Category::class)->find($category);
        $products = $category->getProducts();
        return $this->render('home/index.html.twig', [
            'products' => $products,
            'categories' => $categories,
        ]);
    }
}
