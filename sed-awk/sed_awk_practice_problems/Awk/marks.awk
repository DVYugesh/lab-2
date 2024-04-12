BEGIN{
    FS=","
    OFS="\t"
}

{
    if (NR==1){$(NF+1)="Average";
    print}
    else {
        k=NF
        for(i=2;i<=k;i++){
            $(k+1)+=$i;
        }
        $(NF)=$(NF)/(k-1)
        print
    }
        
}