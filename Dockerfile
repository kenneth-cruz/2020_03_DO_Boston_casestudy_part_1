FROM python3:latest
WORKDIR /app
RUN git clone
"https://github.com/kenneth-cruz/2020_03_DO_Boston_casestudy_part_1.git"
RUN pip install requirements.txt
CMD ["python3"]