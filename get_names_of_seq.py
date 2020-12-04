import os
from sys import stdin,argv
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Alphabet import IUPAC
from Bio import SeqIO


def seq_getter(filename1, out_file):
    "this is a function to open up a .xml file blast results, the out put of\
is all the unique hit"
    f= open(out_file, 'w')

    
    for seq_record in SeqIO.parse(filename1, "fasta"):
        #DNA_seq = seq_record.seq
        #translated_seq = DNA_seq.translate()
        #print translated_seq
        if ".t1" in seq_record.id:
            seq_record.id = seq_record.id.split(".t")[0]
            seq_record.description = ""
            SeqIO.write(seq_record, f, "fasta")
        #print len(seq_record.seq)
    f.close()

    return True 

print("fin")


seq_getter(argv[1], argv[2])
