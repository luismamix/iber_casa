<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210727111835 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE usuario ADD tipousuario_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE usuario ADD CONSTRAINT FK_2265B05D74CA5DCD FOREIGN KEY (tipousuario_id) REFERENCES tipo_usuario (id)');
        $this->addSql('CREATE INDEX IDX_2265B05D74CA5DCD ON usuario (tipousuario_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE usuario DROP FOREIGN KEY FK_2265B05D74CA5DCD');
        $this->addSql('DROP INDEX IDX_2265B05D74CA5DCD ON usuario');
        $this->addSql('ALTER TABLE usuario DROP tipousuario_id');
    }
}
