ALTER TABLE places ADD schemaid VARCHAR(128) DEFAULT NULL;


DELIMITER $$

CREATE FUNCTION `transliterate` (original VARCHAR(128)) RETURNS VARCHAR(128)
BEGIN

  DECLARE translit VARCHAR(128) DEFAULT '';
  DECLARE len INT(3) DEFAULT 0;
  DECLARE pos INT(3) DEFAULT 1;
  DECLARE letter VARCHAR(2);

  SET original = TRIM(LOWER(original));
  SET len = CHAR_LENGTH(original);

  WHILE (original REGEXP ' {2,}') DO
        SET original = REPLACE(original, '  ', ' ');
  END WHILE;


  WHILE (pos <= len) DO
    SET letter = SUBSTRING(original, pos, 1);

    CASE TRUE

      WHEN letter = 'а' THEN SET letter = 'a';
      WHEN letter = 'б' THEN SET letter = 'b';
      WHEN letter = 'в' THEN SET letter = 'v';
      WHEN letter = 'г' THEN SET letter = 'g';
      WHEN letter = 'д' THEN SET letter = 'd';
      WHEN letter = 'е' THEN SET letter = 'e';
      WHEN letter = 'ё' THEN SET letter = 'yo';
      WHEN letter = 'ж' THEN SET letter = 'zh';
      WHEN letter = 'з' THEN SET letter = 'z';
      WHEN letter = 'и' THEN SET letter = 'i';
      WHEN letter = 'й' THEN SET letter = 'j';
      WHEN letter = 'к' THEN SET letter = 'k';
      WHEN letter = 'л' THEN SET letter = 'l';
      WHEN letter = 'м' THEN SET letter = 'm';
      WHEN letter = 'н' THEN SET letter = 'n';
      WHEN letter = 'о' THEN SET letter = 'o';
      WHEN letter = 'п' THEN SET letter = 'p';
      WHEN letter = 'р' THEN SET letter = 'r';
      WHEN letter = 'с' THEN SET letter = 's';
      WHEN letter = 'т' THEN SET letter = 't';
      WHEN letter = 'у' THEN SET letter = 'u';
      WHEN letter = 'ф' THEN SET letter = 'f';
      WHEN letter = 'х' THEN SET letter = 'h';
      WHEN letter = 'ц' THEN SET letter = 'c';
      WHEN letter = 'ч' THEN SET letter = 'ch';
      WHEN letter = 'ш' THEN SET letter = 'sh';
      WHEN letter = 'щ' THEN SET letter = 'tsh';
      WHEN letter = 'ъ' THEN SET letter = '';
      WHEN letter = 'ы' THEN SET letter = 'y';
      WHEN letter = 'ь' THEN SET letter = '';
      WHEN letter = 'э' THEN SET letter = 'e';
      WHEN letter = 'ю' THEN SET letter = 'yu';
      WHEN letter = 'я' THEN SET letter = 'ya';

      WHEN letter IN ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','x','y','z'
                      ,'0','1','2','3','4','5','6','7','8','9','-')
        THEN SET letter = letter;

      ELSE
    SET letter = '_';

    END CASE;

    SET translit = CONCAT(translit, letter);
    SET pos = pos + 1;
  END WHILE;

  WHILE (translit REGEXP '\_{2,}') DO
        SET translit = REPLACE(translit, '__', '_');
  END WHILE;

  RETURN TRIM(BOTH '_' FROM translit);

END $$

DELIMITER ;


UPDATE places p
JOIN places_tr pt ON pt.placeid = p.id AND pt.languageid = 0
SET p.schemaid = CONCAT("s_", transliterate(pt.name));

ALTER TABLE places MODIFY schemaid VARCHAR(128) NOT NULL;

