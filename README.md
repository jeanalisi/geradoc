# GeraDox — Sistema Gerenciador de Documentos

> Atualizado para **PHP 8.x / MySQL 8.x** com tema **WordPress Admin Off-White**.

---

## Descrição

O GeraDox é um sistema de Gerenciamento de Conteúdo Corporativo (ECM — Enterprise Content Management) desenvolvido em **CodeIgniter 2.x**.

Facilita a criação de documentos oficiais padronizados (ofícios, comunicações internas, despachos, pareceres, atos administrativos) em instituições governamentais, controlando numerações, acessos, permissões e possibilitando pesquisas textuais.

---

## Funcionalidades

1. **Padronização dos formatos** dos documentos (cabeçalhos, rodapés, assinaturas, fontes)
2. **Controle da numeração** dos documentos produzidos em cada setor
3. **Acesso remoto** — gerenciamento via internet ou rede interna
4. **Controle de acesso e de alteração**
5. **Pesquisa textual** no universo de documentos produzidos
6. **Workflow** — controle do fluxo de trabalho e tramitações
7. **Repositório** — armazenamento de anexos por setor
8. **Auditoria** — log de acessos e ações
9. **Estatísticas** — relatórios por tipo, setor e período

---

## Requisitos (Ambiente Atualizado)

| Componente | Versão mínima |
|---|---|
| Apache | 2.4+ |
| PHP | 8.1+ |
| MySQL | 8.0+ (ou MariaDB 10.5+) |

**Módulos PHP necessários:** `php-mysql`, `php-mbstring`, `php-xml`, `php-gd`, `php-curl`

---

## Instalação

### 1. Banco de Dados

```sql
CREATE DATABASE geradoc CHARACTER SET utf8 COLLATE utf8_unicode_ci;
```

Importe o arquivo SQL:

```bash
mysql geradoc < docs/geradoc.sql
```

**Importante — MySQL 8.x:** Desabilite o `ONLY_FULL_GROUP_BY` para que as estatísticas funcionem corretamente. Adicione ao arquivo `/etc/mysql/mysql.conf.d/mysqld.cnf`:

```ini
[mysqld]
sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
```

### 2. Configuração da Aplicação

Copie a pasta `geradoc` para o diretório `htdocs` (Apache) ou `/var/www/html/`.

Edite `application/config/config.php`:

```php
$config['base_url'] = "http://localhost/geradoc/";
```

### 3. Arquivo `application/config/database.php`

Crie o arquivo com o conteúdo abaixo:

```php
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$active_group = 'default';
$active_record = TRUE;

$db['default']['hostname'] = 'localhost';
$db['default']['username'] = 'root';       // usuário do banco
$db['default']['password'] = '';           // senha do banco
$db['default']['database'] = 'geradoc';
$db['default']['dbdriver'] = 'mysqli';
$db['default']['dbprefix'] = '';
$db['default']['pconnect'] = TRUE;
$db['default']['db_debug'] = TRUE;
$db['default']['cache_on'] = FALSE;
$db['default']['cachedir'] = '';
$db['default']['char_set'] = 'utf8';
$db['default']['dbcollat'] = 'utf8_unicode_ci';
$db['default']['swap_pre'] = '';
$db['default']['autoinit'] = TRUE;
$db['default']['stricton'] = FALSE;
```

### 4. Arquivo `application/config/email.php`

```php
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['protocol']    = 'smtp';
$config['smtp_host']   = 'smtp.gmail.com';
$config['smtp_crypto'] = 'tls';
$config['smtp_port']   = 587;
$config['starttls']    = TRUE;
$config['validate']    = TRUE;
$config['smtp_user']   = '';   // seu e-mail
$config['smtp_pass']   = '';   // sua senha de app
$config['mailtype']    = 'html';
$config['charset']     = 'utf-8';
$config['wordwrap']    = TRUE;
$config['newline']     = "\r\n";
```

### 5. Permissões

```bash
chmod -R 775 files/
chown -R www-data:www-data files/
```

### 6. Apache — mod_rewrite

```bash
a2enmod rewrite
service apache2 restart
```

---

## Acesso ao Sistema

URL: `http://localhost/geradoc/`

| Campo | Valor |
|---|---|
| E-mail | `admin@geradoc.com.br` |
| Senha | `admin` |

---

## Correções Aplicadas (PHP 8.x)

| Arquivo | Problema | Correção |
|---|---|---|
| `system/core/Input.php` | `filter_var()` com `$flag = ''` | Alterado para `$flag = 0` |
| `system/core/Security.php` | `each()` removida no PHP 8 | Substituída por `foreach(array_keys())` |
| `system/libraries/Profiler.php` | Sintaxe `->_compile_{$key}` removida | Variável intermediária |
| `application/libraries/jpgraph/*.php` | `each()` em múltiplos locais | Substituídas por `foreach()` |

---

## Tema Visual

O sistema utiliza o tema **WordPress Admin Off-White**:

- Sidebar escura fixa (`#1d2327`) com menu colapsável
- Topbar branca com data, countdown de sessão e avatar do usuário
- Área de conteúdo off-white (`#f0f0f1`)
- Paleta azul WordPress (`#2271b1`) — sem cores verdes
- Totalmente responsivo (mobile-friendly)

---

## Licença

Software livre sob a **GNU GPL v3**. Redistribuição e modificação permitidas conforme os termos da licença.

Dúvidas, erros ou sugestões: tarsodecastro@gmail.com
