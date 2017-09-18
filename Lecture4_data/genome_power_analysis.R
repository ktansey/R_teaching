genome_power_analysis <- function(maf, N, alpha, effect) {   
    
    ### this is the null for the chi2 test NCP calculation
    chisq.threshold = qchisq(alpha, df = 1, lower = FALSE, ncp = 0)
    
    ### NCP from here is from : Sham & Purcell Nature Reviews Genetics 2014 doi:10.1038/nrg3706
    power = pchisq(chisq.threshold, 
                    df = 1, 
                    ncp = effect^2 *2*N* maf*(1-maf), 
                    lower = FALSE)
    return(power)
}
