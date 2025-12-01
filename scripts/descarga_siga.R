
library(siga)
library(dplyr)

# Estaciones objetivo
objetivo <- c("Bella Vista", "Mercedes", "Sombrerito")
fecha_desde <- Sys.Date() - 14
fecha_hasta <- Sys.Date()

# Listar estaciones
est <- siga_estaciones()
sel <- est %>% filter(grepl(paste(objetivo, collapse="|"), nombre, ignore.case=TRUE))

# Descargar datos
dir_out <- "datos/crudos"
dir.create(dir_out, showWarnings = FALSE, recursive = TRUE)
archivos <- siga_descargar(sel, desde=fecha_desde, hasta=fecha_hasta, dir=dir_out)
print(archivos)
