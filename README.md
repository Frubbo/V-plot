# V-plot Matrix Generator

Generate a V-plot heatmap showing cfDNA fragment length distribution around motif centers.

## Requirements

- Python 3.x
- R with ggplot2 and tidyr

## Usage

```bash
cat input_data.tsv | python3 vplot_matrix.py > matrix_long_form.tsv
Rscript plot.R
```

This will:
1. Read input data from stdin
2. Generate a matrix file (`matrix_long_form.tsv`) in long form (x, y, z)
3. Create a heatmap visualization (`vplot_heatmap.png`)

## Input Format

The input should be a TSV file with at least 12 columns where:
- Columns 3-4: Motif start and end positions
- Columns 9-10: Fragment start and end positions  
- Column 12: Fragment length

## Output

- `matrix_long_form.tsv` - Matrix in long form (distance from motif center, fragment length, count)
- `vplot_heatmap.png` - Heatmap visualization showing fragment distribution (fragments ≤200 bp)