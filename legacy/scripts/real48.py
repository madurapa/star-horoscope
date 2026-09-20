def dec(ax,bx,dx):
    b=[ax&0xFF,ax>>8,bx&0xFF,bx>>8,dx&0xFF,dx>>8]
    e=b[0]
    if e==0: return 0.0
    sign=-1.0 if b[5]&0x80 else 1.0
    m=((b[5]&0x7F)<<32)|(b[4]<<24)|(b[3]<<16)|(b[2]<<8)|b[1]
    return sign*(1.0+m/2.0**39)*2.0**(e-129)
if __name__=="__main__":
    consts={
     "K1 (day-angle)":(0x2183,0xDAA2,0x490F),
     "k_a cos2B":(0x0BC7C,0x45CB,0x277C),
     "k_b sin2B":(0x0FD7A,0x0C0C1,0x6F73),
     "k_c cosB" :(0x437C,0x2C1F,0x0363),
     "k_d sinB" :(0x5F77,0x0ADD1,0x74D7),
     "k_e const":(0x0AA73,0x5182,0x1D49),
     "k_f scale":(0x0E188,0x147A,0x652E),
     "365.0":(0x0089,0x0000,0x3680),
     "60.0":(0x0086,0x0000,0x7000),
     "15.0":(0x0084,0x0000,0x7000),
     "24.0":(0x0084,0x0000,0x4000),
     "gmst c0":(0x0FB8F,0x173F,0x3C5D),
    }
    for k,(a,b,d) in consts.items():
        print(f"{k:16} {dec(a,b,d)!r}")
