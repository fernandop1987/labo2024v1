# Cargar los datos desde archivos externos
datos1 <- read.csv("C:/Users/peton/Documents/Maestría CD/Lab de Implementación I/TareasHogar/exp1_error.csv", header = TRUE)  # Ajusta los parámetros según sea necesario
datos2 <- read.csv("C:/Users/peton/Documents/Maestría CD/Lab de Implementación I/TareasHogar/exp1.csv", header = TRUE)  # Ajusta los parámetros según sea necesario

# Combina los vectores en la lista en un solo vector
datos1_combined <- unlist(datos1)
datos2_combined <- unlist(datos2)

# Convierte los datos combinados a tipo numérico
vector1 <- as.numeric(datos1_combined)
vector2 <- as.numeric(datos2_combined)


# Supongamos que tienes dos vectores de datos: vector1 y vector2

# Función para calcular el máximo de un subvector
max_subvector <- function(vector, size) {
  sample_max <- sample(vector, size, replace = TRUE)
  return(max(sample_max))
}

# Definir el número de subconjuntos y el tamaño del subvector
num_subsets <- 10
subvector_size <- 10

# Generar matriz de máximos para vector1
max_values_vector1 <- matrix(NA, nrow = num_subsets, ncol = 1)


for (i in 1:num_subsets) {
  max_values_vector1[i, 1] <- max_subvector(vector1, subvector_size)
}



# Generar matriz de máximos para vector2
max_values_vector2 <- matrix(NA, nrow = num_subsets, ncol = 1)


for (i in 1:num_subsets) {
  max_values_vector2[i, 1] <- max_subvector(vector2, subvector_size)
}




print(max_values_vector1)
print(max_values_vector2)

#-----------------------
# Realizar el test de Wilcoxon para cada subconjunto
###wilcox_results <- vector("list", num_subsets)

###for (i in 1:num_subsets) {
###  wilcox_results[[i]] <- wilcox.test(max_values_vector1[i,], max_values_vector2[i,], paired = FALSE, alternative = "greater")
###}



# Contar la proporción de veces que se rechaza la hipótesis nula
###reject_null <- sum(sapply(wilcox_results, function(res) res$p.value < 0.05)) / num_subsets

# Imprimir los resultados
###print(reject_null)

#-----------------------


# Realizar el test de Wilcoxon
resultado <- wilcox.test(max_values_vector1, max_values_vector2, paired = TRUE)

# Mostrar el resultado
print(resultado)




#-----------------------

#Vectores
baseline <- c(59916000, 59301000, 59001000, 60108000, 59538000)
exp1_err <- c(61248000, 62235000, 60960000, 61188000, 61452000)
exp2_err <- c(60573000, 60606000, 60708000, 60375000, 60648000)
exp2 <- c(60915000, 62208000, 61722000, 61395000, 60036000)



# Realizar el test de Wilcoxon
resultado <- wilcox.test(exp1_err, exp2, alternative = "two.sided")

# Mostrar el resultado
print(resultado)