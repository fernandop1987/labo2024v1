# Este script almacena definitivamente sus cinco semillas
# en el bucket, de forma que NO deba cargarlas en cada script

require( "data.table")

# reemplazar aqui por SUS semillas 
mis_semillas <- c(110251, 190283, 340211, 577463, 880249)

tabla_semillas <- as.data.table(list( semilla = mis_semillas ))

fwrite( tabla_semillas,
    file = "~/buckets/b1/datasets/mis_semillas.txt",
    sep = "\t"
)
