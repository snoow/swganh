/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for procedure galaxy_manager.sp_CreateBotAccount
DROP PROCEDURE IF EXISTS `sp_CreateBotAccount`;
DELIMITER //
CREATE PROCEDURE `sp_CreateBotAccount`(
IN username char(32),
    IN password_ char(32))
BEGIN
    DECLARE salt_ VARCHAR(50);
    DECLARE saltedPASS VARCHAR(100);
    DECLARE account_id INT;
    SET salt_ = NOW()+username;

    select SHA1(CONCAT(password_,'{',salt_,'}')) into saltedPASS;

    INSERT INTO `account` (
        `username`, `username_canonical`, `email`, `email_canonical`, `enabled`,
        `salt`, `password`, `last_login`, `locked`, `expired`, `roles`,
        `credentials_expired`)
    VALUES (
        username, username, 'bot@swganh.org', 'bot@swganh.org', 1, salt_, 
        saltedPASS, NOW(), 0, 0, '0', 0);
END//
DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
