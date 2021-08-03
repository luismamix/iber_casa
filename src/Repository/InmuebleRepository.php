<?php

namespace App\Repository;

use App\Entity\Inmueble;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Inmueble|null find($id, $lockMode = null, $lockVersion = null)
 * @method Inmueble|null findOneBy(array $criteria, array $orderBy = null)
 * @method Inmueble[]    findAll()
 * @method Inmueble[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class InmuebleRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Inmueble::class);
    }

    // /**
    //  * @return Inmueble[] Returns an array of Inmueble objects
    //  */
    
    public function findAllOptimized()
    {
        $em =  $this->getEntityManager();

        $q = $em->createQuery(
            "SELECT in, ca, com, pro, st1, st2, tpl, u 
            FROM App\Entity\Inmueble in
            JOIN in.cartera ca
            JOIN in.comercializacion com
            JOIN in.propietario pro
            JOIN in.status1 st1
            JOIN in.status2 st2
            JOIN in.tipologia tpl
            JOIN in.uso u
            ORDER BY in.id ASC"
        );

         // returns an array of Product objects
         return $q->getResult();
    }

    // /**
    //  * @return Inmueble[] Returns an array of Inmueble objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('i.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Inmueble
    {
        return $this->createQueryBuilder('i')
            ->andWhere('i.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
