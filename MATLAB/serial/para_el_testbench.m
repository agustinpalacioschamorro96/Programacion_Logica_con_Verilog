
for i=1:16
fprintf('\n#`Tbit;\n\tcoef_in= 12''d%d;\n\tcambio_coef_i=1;\t//coef %d\n#`Tbit\n\tcambio_coef_i=0;\n',coef(i),(i-1))
end


