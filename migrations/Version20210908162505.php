<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210908162505 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE venta ADD propietario_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE venta ADD CONSTRAINT FK_8FE7EE5553C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('CREATE INDEX IDX_8FE7EE5553C8D32C ON venta (propietario_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE venta DROP FOREIGN KEY FK_8FE7EE5553C8D32C');
        $this->addSql('DROP INDEX IDX_8FE7EE5553C8D32C ON venta');
        $this->addSql('ALTER TABLE venta DROP propietario_id');
    }
}
