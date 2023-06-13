[top]
components : coverage 

[coverage]
type : cell
dim : (13,13,5)
delay : transport
defaultDelayTime : 100   
border : nowrapped
     
neighbors :                                    coverage(-2,0,0)
neighbors :                  coverage(-1,-1,0) coverage(-1,0,0) coverage(-1,1,0) 
neighbors : coverage(0,-2,0) coverage(0,-1,0)  coverage(0,0,0)  coverage(0,1,0)  coverage(0,2,0)                  
neighbors :                  coverage(1,-1,0)  coverage(1,0,0)  coverage(1,1,0) 
neighbors :                                    coverage(2,0,0) 
     
neighbors :                                    coverage(-2,0,1)
neighbors :                  coverage(-1,-1,1) coverage(-1,0,1) coverage(-1,1,1) 
neighbors : coverage(0,-2,1) coverage(0,-1,1)  coverage(0,0,1)  coverage(0,1,1)  coverage(0,2,1)                  
neighbors :                  coverage(1,-1,1)  coverage(1,0,1)  coverage(1,1,1) 
neighbors :                                    coverage(2,0,1)

neighbors :                                      coverage(-2,0,-1)
neighbors :                   coverage(-1,-1,-1) coverage(-1,0,-1) coverage(-1,1,-1)
neighbors : coverage(0,-2,-1) coverage(0,-1,-1)  coverage(0,0,-1)  coverage(0,1,-1) coverage(0,2,-1)
neighbors :                   coverage(1,-1,-1)  coverage(1,0,-1)  coverage(1,1,-1)
neighbors :                                      coverage(2,0,-1) 

neighbors :                                      coverage(-2,0,-2)
neighbors :                   coverage(-1,-1,-2) coverage(-1,0,-2) coverage(-1,1,-2)
neighbors : coverage(0,-2,-2) coverage(0,-1,-2)  coverage(0,0,-2)  coverage(0,1,-2) coverage(0,2,-2)
neighbors :                   coverage(1,-1,-2)  coverage(1,0,-2)  coverage(1,1,-2)
neighbors :                                      coverage(2,0,-2)
     
neighbors :                                     coverage(0,0,2) coverage(0,0,3) coverage(0,0,4)  
       

initialvalue : 9
initialCellsValue : Coverage.val
localtransition : Existence

zone : Movement   { (0,0,1)..(12,12,1) }
zone : SigStrUE   { (0,0,2)..(12,12,2) }
zone : BSNum      { (0,0,3)..(12,12,3) }
zone : SigStr     { (0,0,4)..(12,12,4) }

[Existence]
rule : {randInt(1)} 100 { (0,0,0) = 9 } %Just excute at first.
rule : 0 100 { (0,0,0) = 1 and (0,0,3) = 10 }
rule : 1 100 { (0,0,0) = 1 and (0,0,1) = 6 }  %Stay at this cell
rule : 0 100 { (0,0,0) = 1 and (0,1,0) =  0 and (0,0,1) = 2 } %Go East
rule : 0 100 { (0,0,0) = 1 and (1,0,0) =  0 and (0,0,1) = 3  and ((1,-1,0) = 0 or (1,-1,1) != 2) }   %Go South
rule : 0 100 { (0,0,0) = 1 and (0,-1,0) = 0 and (0,0,1) = 4  and ((0,-2,0) = 0 or (0,-2,1) != 2)   and ((-1,-1,0) = 0 or (-1,-1,1) != 3) }  %Go West
rule : 0 100 { (0,0,0) = 1 and (-1,0,0) = 0 and (0,0,1) = 5  and ((-1,-1,0) = 0 or (-1,-1,1) != 2) and ((-2,0,0) = 0 or (-2,0,1) != 3) and ((-1,1,0) = 0 or (-1,1,1) != 4) }  %Go North
%                              cell has coverage      input from West                         input from North                input from East                  input from South    
rule : 1 100 { (0,0,0) = 0 and (0,0,3) != 10 and (((0,-1,0) = 1 and (0,-1,1) = 2) or ((-1,0,0) = 1 and (-1,0,1) = 3) or ((0,1,0) = 1 and (0,1,1) = 4) or ((1,0,0) = 1 and (1,0,1) = 5)) }
rule : {1} 100 {(0,0,0) = 1}  %When the ruls reach here it means that Cell wants to move but it coulden't
rule : {0} 100 {(0,0,0) = 0}  %Nothing happen for this Cell.

[Movement]
rule : 9 100 { (0,0,2) = 10 } %No need to caculate movement because no BS cover this cell.
rule : {randInt(4) + 2} 100 { (0,0,0) = 9 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 6 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 0 and (0,-1,-1) = 1 and (0,-1,0) = 2 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 0 and (-1,0,-1) = 1 and (-1,0,0) = 3 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 0 and (0,1,-1) = 1  and (0,1,0) = 4  }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 0 and (1,0,-1) = 1  and (1,0,0) = 5  }

rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 2 and (0,1,-1)  = 1 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 3 and (1,0,-1)  = 1 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 4 and (0,-1,-1) = 1 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 5 and (-1,0,-1) = 1 }

rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 2 and ((0,1,-1)  != 1 and (0,1,-1)  != 0) }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 3 and ((1,0,-1)  != 1 and (1,0,-1)  != 0)}
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 4 and ((0,-1,-1) != 1 and (0,-1,-1)  != 0)}
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 5 and ((-1,0,-1) != 1 and (-1,0,-1)  != 0)}

rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 3 and (1,-1,-1) = 1  and (1,-1,0) = 2 }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 4 and ( ((0,-2,-1) = 1  and (0,-2,0) = 2) or ((-1,-1,-1) = 1  and (-1,-1,0) = 3)   ) }
rule : {randInt(4) + 2} 100 { (0,0,-1) = 1 and (0,0,0) = 5 and ( ((-1,-1,-1) = 1  and (-1,-1,0) = 2) or ((-2,0,-1) = 1  and (-2,0,0) = 3) or ((-1,1,-1) = 1  and (-1,1,0) = 4)  ) }

rule : 8 100 { (0,0,-1) != 1 or (0,0,0) != 6 } 
rule : 8 100 { (0,0,-1) != 0 or (0,-1,-1) != 1 or (0,-1,0) != 2 }
rule : 8 100 { (0,0,-1) != 0 or (-1,0,-1) != 1 or (-1,0,0) != 3 }
rule : 8 100 { (0,0,-1) != 0 or (0,1,-1) != 1  or (0,1,0) != 4  }
rule : 8 100 { (0,0,-1) != 0 or (1,0,-1) != 1  or (1,0,0) != 5  }

[SigStrUE]
rule : 7 100 { (0,0,1) = 10 } %No need to caculate movement because no BS cover this cell.
rule : 7 100 { (0,0,-2) = 0 and (0,-1,-1) != 2 and (-1,0,-1) != 3 and (0,1,-1) != 4 and (1,0,-1) != 5 }

rule : 7 100 { (0,0,-2) = 1 and (0,0,-1) = 2 and (0,1,-2) = 0 }
rule : 7 100 { (0,0,-2) = 1 and (0,0,-1) = 3 and (1,0,-2) = 0 and ((1,-1,-2) = 0 or (1,-1,-1) != 2) }
rule : 7 100 { (0,0,-2) = 1 and (0,0,-1) = 4 and (0,-1,-2) = 0 and ((0,-2,-2) = 0 or (0,-2,-1) != 2) and ((-1,-1,-2) = 0 or (-1,-1,-1) != 3) }
rule : 7 100 { (0,0,-2) = 1 and (0,0,-1) = 5 and (-1,0,-2) = 0 and ((-1,-1,-2) = 0 or (-1,-1,-1) != 2) and ((-2,0,-2) = 0 or (-2,0,-1) != 3) and ((-1,1,-2) = 0 or (-1,1,-1) != 4) }

rule : 25 100 { (0,0,2) = 20 } 
rule : 26 100 { (0,0,2) = 21 }
rule : 27 100 { (0,0,2) = 22 }
rule : 28 100 { (0,0,2) = 23 }

[BSNum]
rule : {10} 100 {(0,0,0) = 10} %Number of BS that can support this cell is 0
rule : {11} 100 {(0,0,0) = 11} %Number of BS that can support this cell is 1
rule : {12} 100 {(0,0,0) = 12} %Number of BS that can support this cell is 2 (It does not mean that the coverage should be betther than the others. It happens in border areas of Cell Network.)
rule : {13} 100 {(0,0,0) = 13} %Number of BS that can support this cell is 3  It does not mean that the coverage should be betther than the others. It happens in border areas of Cell Network.)
rule : 9 100 { (0,0,0) = 9 }

[SigStr]
rule : {20} 100 {(0,0,0) = 20}  %No Coverage
rule : {21} 100 {(0,0,0) = 21}  %Weak Coverage      -- Near the Cell Net border (without CoMP).
rule : {22} 100 {(0,0,0) = 22}  %Good Coverage      -- Cell has one hop distance from center of Cell Net or It is the border of the Cell Net ans can support by more than one BS (with CoMP).
rule : {23} 100 {(0,0,0) = 23}  %Excellent Coverage -- EU is at the center of the Cell Net.
rule : 9 100 { (0,0,0) = 9 }
