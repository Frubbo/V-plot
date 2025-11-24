# V-plot Matrix Generator

Generate a V-plot heatmap showing cfDNA fragment length distribution around motif centers.

## Requirements

- Python 3.x
- R with ggplot2 and tidyr

## Usage

```bash
zcat *.bed.gz | python3 vplot_matrix.py > matrix_long_form.tsv
Rscript plot.R
```

This will:
1. Read input data from stdin
2. Generate a matrix file (`matrix_long_form.tsv`) in long form (x, y, z)
3. Create a heatmap visualization (`vplot_heatmap.png`)

## Output

- `matrix_long_form.tsv` - Matrix in long form (distance from motif center, fragment length, count)
- `vplot_heatmap.png` - Heatmap visualization showing fragment distribution (fragments ≤200 bp)
