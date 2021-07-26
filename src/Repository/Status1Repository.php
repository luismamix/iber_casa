<?php

namespace App\Repository;

use App\Entity\Status1;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Status1|null find($id, $lockMode = null, $lockVersion = null)
 * @method Status1|null findOneBy(array $criteria, array $orderBy = null)
 * @method Status1[]    findAll()
 * @method Status1[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class Status1Repository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Status1::class);
    }

    // /**
    //  * @return Status1[] Returns an array of Status1 objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Status1
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
