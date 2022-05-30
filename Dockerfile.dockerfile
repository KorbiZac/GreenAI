FROM trestletech/plumber

COPY modelBest.rds /modelBest.rds
COPY MLR_GRENNAI.R /MLR_GRENNAI.R
COPY plumber-debug-GreenAI.R /plumber-debug-GreenAI.R
COPY plumber-api-GreenAI.R /plumber.R

CMD ["/plumber.R"]