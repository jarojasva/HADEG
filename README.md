![HADEG](./logo_HADEG.png) 

# HADEG: A Curated Hydrocarbon Aerobic Degradation Enzymes and Genes Database

Jorge Rojas-Vargas<sup>1</sup>, Hugo G. Castelán-Sánchez<sup>2</sup>, Liliana Pardo-López<sup>1</sup>

<sup>1</sup>Departamento de Microbiología Molecular, Instituto de Biotecnología, UNAM, Av. Universidad #2001, Col. Chamilpa, 62210 Cuernavaca, Morelos, México

<sup>2</sup>Programa de Investigadoras e Investigadores por México. Grupo de Genómica y Dinámica Evolutiva de Microorganismos Emergentes. Consejo Nacional de Ciencia y Tecnología. Av. Insurgentes Sur 1582, Crédito Constructor, Benito Juárez, CP 03940, Ciudad de México, México.

## Description

The Hydrocarbon Aerobic Degradation Enzymes and Genes (HADEG) is a manually curated database containing sequences of experimentally validated proteins and genes to be used for annotation purposes. The first version described in the published article (*DOI 10.1016/j.compbiolchem.2023.107966*) had 259 proteins for hydrocarbon (HC) degradation, 160 for plastic degradation, and 32 for biosurfactant production (September, 2023). The updated database has 402 for HC degradation, 191 for plastic degradation, and 36 for biosurfactant production (November, 2023). The database is updated regularly.

## Recommended immplementation

1- Install Proteinortho software in your computer or server (https://anaconda.org/bioconda/proteinortho).

2- Annotate your genome(s) using your preferred annotation software and save the resulting .faa file(s) in a designated directory.

3- Download the "HADEG_protein_database_231119.faa" and place it in the same directory.

4- Execute Proteinortho, comparing your .faa file(s) with the HADEG database: 
```sh
proteinortho Directory_with_proteomes/*.faa -identity=50 -conn=0.3 -project=Results_HADEG
```
5- Identify the orthologs to the HADEG database in the final TSV file.

NOTE: Under update process.

## Description of this GitHub repository

### 1. Seq_amino_acids

Contains the amino acid sequences divided in hydrocarbon groups and biosurfactant production:

- Alkanes
- Alkenes
- Aromatics
- Biosurfactants
- Plastics

### 2. Seq_nucleotides

Contains the nucleotides sequences divided in hydrocarbon groups and biosurfactant production:

- Alkanes
- Alkenes
- Aromatics
- Biosurfactants
- Plastics

### 3. Tables

Contains tables with degradation pathways, biodegradation production, and protein domains:

- 1_Aerobic_alkane_degradation_pathways_and_genes
- 2_Aerobic_alkene_degradation_pathways_and_genes
- 3_Aerobic_aromatic_degradation_pathways_and_genes
- 4_Plastic_degradation_pathways_and_genes
- 5_Biosurfactant_production_genes
- 6_Protein_domains_of_HADEG_proteins
- 7_All_pathways


## Citation

Rojas-Vargas, J, Castelán-Sánchez, HG, Pardo-López, L (2023) HADEG: A curated hydrocarbon aerobic degradation enzymes and genes database. Computational Biology and Chemistry. DOI 10.1016/j.compbiolchem.2023.107966

https://www.sciencedirect.com/science/article/abs/pii/S1476927123001573?via%3Dihub
