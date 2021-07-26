<?php

namespace App\Repository;

use App\Entity\Cartera;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Cartera|null find($id, $lockMode = null, $lockVersion = null)
 * @method Cartera|null findOneBy(array $criteria, array $orderBy = null)
 * @method Cartera[]    findAll()
 * @method Cartera[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CarteraRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Cartera::class);
    }

    // /**
    //  * @return Cartera[] Returns an array of Cartera objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Cartera
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
