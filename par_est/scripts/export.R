# Round parameters and create a final version of the parameter file

fpars <- signif(c(m$par, fixed), 3)

# Create file
system('cp ../pars/pars_template.txt ../final_pars/pars.txt')
for (i in 1:length(fpars)) {
  system(paste0('sed -i s/', names(fpars)[i], '/', fpars[i], '/g ../final_pars/pars.txt'))
}


