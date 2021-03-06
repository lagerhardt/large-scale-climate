#!/bin/bash
#SBATCH -p regular 
#SBATCH -N 50
#SBATCH -t 5:00:00
#SBATCH --qos=premium 
#SBATCH --ccm
#SBATCH -o cori-spark-%j.out
#SBATCH -e cori-spark-%j.err
module load spark/1.6.0

start-all.sh
module load collectl
start-collectl.sh
INDIR=/project/projectdirs/paralleldb/spark/benchmarks/pca_climate/large-scale-climate

cd $INDIR
src/nersc.computeEOFs.sh $INDIR/target/scala-2.10/cori-large-scale-climate-assembly-0.0.1.jar

stop-all.sh

stop-collectl.sh

