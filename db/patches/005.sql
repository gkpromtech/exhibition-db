UPDATE organizations
SET logo = CONCAT('/images/logos/', id, '.png')
WHERE logo IS NOT NULL AND logo like '/images/logos/%.png';
