# Round parameters and create a final version of the parameter file

fpars <- abs(signif(c(m$par, fixed), 3))

# Create file
system('cp ../pars/pars_template.txt ../final_pars/pars.txt')

for (i in 1:length(fpars)) {
  system(paste0('sed -i s/', names(fpars)[i], '/', fpars[i], '/g ../final_pars/pars.txt'))
}

# Place copy in par_sets directory
system(paste0('cp ../final_pars/pars.txt ../../par_sets/pars', parver, '.txt'))
system('cp ../final_pars/pars.txt ../../par_sets/pars.txt')

