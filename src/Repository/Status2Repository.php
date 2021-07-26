<?php

namespace App\Repository;

use App\Entity\Status2;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Status2|null find($id, $lockMode = null, $lockVersion = null)
 * @method Status2|null findOneBy(array $criteria, array $orderBy = null)
 * @method Status2[]    findAll()
 * @method Status2[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class Status2Repository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Status2::class);
    }

    // /**
    //  * @return Status2[] Returns an array of Status2 objects
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
    public function findOneBySomeField($value): ?Status2
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
