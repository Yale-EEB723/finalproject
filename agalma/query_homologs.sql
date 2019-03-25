SELECT DISTINCT
       homology.id          AS homology_id,
       genes.gene           AS gene,
       models.catalog_id    AS catalog_id,
       models.id            AS id,
       homology_models.homology_id,
       homology_models.model_id,
       sequences.model_id,
       genes.model_id
FROM agalma_homology        AS homology        JOIN
     agalma_homology_models AS homology_models JOIN
     agalma_models          AS models          JOIN
     agalma_genes           AS genes          JOIN
     agalma_sequences       AS sequences
     ON homology.id=homology_models.homology_id AND
        homology_models.model_id=models.id AND
        models.id=sequences.model_id AND
        models.id=genes.model_id
ORDER BY homology.id ASC;