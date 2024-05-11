# Cargar el paquete necesario para visualizaciones
library(ggplot2)
library(tidyr)
library(reshape)
library(ggrepel)
library(scales)  # for number formatting

# Cargar el archivo CSV
datos <- read.csv("C:/Users/peton/Documents/Maestría CD/Lab de Implementación I/TareasHogar/Datos_para_R.csv", sep = ";", header = TRUE)


# Reshape the data from wide to long format using gather
df <- gather(datos, Variables, Valor, -envios)

# Filter out rows where Variables is not equal to "A"
df <- df[df$Variables != "envios", ]

# Print the transformed data
print(head(df, 100))




# Subset the data frame
df2 <- df[df$envios > 7000, ]






# Create the line chart
line_chart <- ggplot(df2, aes(x = envios, y = Valor, color = Variables, group = Variables)) +
  geom_line() +
  geom_point()


print (line_chart)