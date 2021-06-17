<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class SearchController extends AbstractController
{
    /**
     * @Route("/search/{searchSlug}", name="search")
     */
    public function index($searchSlug,CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findAll();
        $products = $this->getDoctrine()->getRepository(Product::class)->findByName($searchSlug);
        return $this->render('home/index.html.twig', [
            'products'=>$products,
            'categories' =>$categories,
        ]);
    }

    public function handleSearch(Request $request){

    }



}
