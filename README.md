# ento_microbiome
Repository containing supplementary material and scripts used for the study "How a fungal pathogen infection shapes insect-associated microbial community"

Python scripts used for sequencing data processing:
1. MultiSPLIT.py - script used for splitting amplicon reads based on the targeted marker gene

2. LSD.py - wrapper script that merges forward and reverse reads and converts them to a FASTA format based on a PHRED score of at least 30. Then, the script dereplicates, denoises, assigns taxonomy, and clusters sequences based on their 97% similarity. This results in a table with read counts, their classification to OTUs, and their taxonomic designations across the samples.

3. QUACK.py - a decontamination script that further splits sequences based on their taxonomical assignment and provides a table for further manual processing. Reads assigned as contaminants based on their presence in negative samples or by their taxonomic labels (e.g., reads coming from mitochondria, chloroplasts, archaea) are removed, while the reads of quantification spike-ins are kept for manual bacterial abundance estimation.

Additionally, processed data was visualised using this Processing script: Barplot_visualisation_script.pyde and R scripts: nmds.R and fung_cor.R

Supplement_tables.xlsx contains data visualized in figures. Supplementary table legends:
- S1_Collections - list of collection samples with descriptions, coordinates, and descriptions of sites and dates of collection
- S2_Specimens - list of all specimens with unique IDs, collection sites, morphology and COI-based taxonomy, assigned sex, COI barcode sequences, the ITS2/COI read ratio, and numbers of amplicon reads in each targeted marker region
- S3_COI_Zotus - table of COI zOTUs with taxonomic assignment and numbers of amplicon reads for each insect sample
- S4_emITS2_zOTUs - table of Entomophthora-specific ITS2 zOTUs with taxonomic assignment and numbers of amplicon reads for each insect sample
- S5_16S_Zotus - table of 16S (bacterial) zOTUs with taxonomic assignment and numbers of amplicon reads for each insect sample
- S6_Spearman_correlation - a table showing Spearman's correlation values between the ITS2/COI ratio and number of bacteria for the 21 most abundant bacterial genotypes and the total number of bacteria
