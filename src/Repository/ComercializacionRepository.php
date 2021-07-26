<?php

namespace App\Repository;

use App\Entity\Comercializacion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Comercializacion|null find($id, $lockMode = null, $lockVersion = null)
 * @method Comercializacion|null findOneBy(array $criteria, array $orderBy = null)
 * @method Comercializacion[]    findAll()
 * @method Comercializacion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ComercializacionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Comercializacion::class);
    }

    // /**
    //  * @return Comercializacion[] Returns an array of Comercializacion objects
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
    public function findOneBySomeField($value): ?Comercializacion
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
