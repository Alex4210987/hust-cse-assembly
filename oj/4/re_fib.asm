fib:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:	f3 0f 1e fb          	endbr32
    1004:	53                   	push   ebx
    1005:	83 ec 08             	sub    esp,0x8
    1008:	e8 b3 00 00 00       	call   10c0 <__x86.get_pc_thunk.bx>
    100d:	81 c3 c3 2f 00 00    	add    ebx,0x2fc3
    1013:	8b 83 24 00 00 00    	mov    eax,DWORD PTR [ebx+0x24]
    1019:	85 c0                	test   eax,eax
    101b:	74 02                	je     101f <_init+0x1f>
    101d:	ff d0                	call   eax
    101f:	83 c4 08             	add    esp,0x8
    1022:	5b                   	pop    ebx
    1023:	c3                   	ret

Disassembly of section .plt:

00001030 <__libc_start_main@plt-0x10>:
    1030:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
    1036:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
    103c:	00 00                	add    BYTE PTR [eax],al
	...

00001040 <__libc_start_main@plt>:
    1040:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
    1046:	68 00 00 00 00       	push   0x0
    104b:	e9 e0 ff ff ff       	jmp    1030 <_init+0x30>

00001050 <printf@plt>:
    1050:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
    1056:	68 08 00 00 00       	push   0x8
    105b:	e9 d0 ff ff ff       	jmp    1030 <_init+0x30>

00001060 <__stack_chk_fail@plt>:
    1060:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
    1066:	68 10 00 00 00       	push   0x10
    106b:	e9 c0 ff ff ff       	jmp    1030 <_init+0x30>

00001070 <__isoc99_scanf@plt>:
    1070:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
    1076:	68 18 00 00 00       	push   0x18
    107b:	e9 b0 ff ff ff       	jmp    1030 <_init+0x30>

Disassembly of section .plt.got:

00001080 <__cxa_finalize@plt>:
    1080:	ff a3 20 00 00 00    	jmp    DWORD PTR [ebx+0x20]
    1086:	66 90                	xchg   ax,ax

Disassembly of section .text:

00001090 <_start>:
    1090:	f3 0f 1e fb          	endbr32
    1094:	31 ed                	xor    ebp,ebp
    1096:	5e                   	pop    esi
    1097:	89 e1                	mov    ecx,esp
    1099:	83 e4 f0             	and    esp,0xfffffff0
    109c:	50                   	push   eax
    109d:	54                   	push   esp
    109e:	52                   	push   edx
    109f:	e8 18 00 00 00       	call   10bc <_start+0x2c>
    10a4:	81 c3 2c 2f 00 00    	add    ebx,0x2f2c
    10aa:	6a 00                	push   0x0
    10ac:	6a 00                	push   0x0
    10ae:	51                   	push   ecx
    10af:	56                   	push   esi
    10b0:	ff b3 28 00 00 00    	push   DWORD PTR [ebx+0x28]
    10b6:	e8 85 ff ff ff       	call   1040 <__libc_start_main@plt>
    10bb:	f4                   	hlt
    10bc:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10bf:	c3                   	ret

000010c0 <__x86.get_pc_thunk.bx>:
    10c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    10c3:	c3                   	ret
    10c4:	66 90                	xchg   ax,ax
    10c6:	66 90                	xchg   ax,ax
    10c8:	66 90                	xchg   ax,ax
    10ca:	66 90                	xchg   ax,ax
    10cc:	66 90                	xchg   ax,ax
    10ce:	66 90                	xchg   ax,ax

000010d0 <deregister_tm_clones>:
    10d0:	e8 e4 00 00 00       	call   11b9 <__x86.get_pc_thunk.dx>
    10d5:	81 c2 fb 2e 00 00    	add    edx,0x2efb
    10db:	8d 8a 3c 00 00 00    	lea    ecx,[edx+0x3c]
    10e1:	8d 82 3c 00 00 00    	lea    eax,[edx+0x3c]
    10e7:	39 c8                	cmp    eax,ecx
    10e9:	74 1d                	je     1108 <deregister_tm_clones+0x38>
    10eb:	8b 82 1c 00 00 00    	mov    eax,DWORD PTR [edx+0x1c]
    10f1:	85 c0                	test   eax,eax
    10f3:	74 13                	je     1108 <deregister_tm_clones+0x38>
    10f5:	55                   	push   ebp
    10f6:	89 e5                	mov    ebp,esp
    10f8:	83 ec 14             	sub    esp,0x14
    10fb:	51                   	push   ecx
    10fc:	ff d0                	call   eax
    10fe:	83 c4 10             	add    esp,0x10
    1101:	c9                   	leave
    1102:	c3                   	ret
    1103:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
    1107:	90                   	nop
    1108:	c3                   	ret
    1109:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00001110 <register_tm_clones>:
    1110:	e8 a4 00 00 00       	call   11b9 <__x86.get_pc_thunk.dx>
    1115:	81 c2 bb 2e 00 00    	add    edx,0x2ebb
    111b:	55                   	push   ebp
    111c:	89 e5                	mov    ebp,esp
    111e:	53                   	push   ebx
    111f:	8d 8a 3c 00 00 00    	lea    ecx,[edx+0x3c]
    1125:	8d 82 3c 00 00 00    	lea    eax,[edx+0x3c]
    112b:	83 ec 04             	sub    esp,0x4
    112e:	29 c8                	sub    eax,ecx
    1130:	89 c3                	mov    ebx,eax
    1132:	c1 e8 1f             	shr    eax,0x1f
    1135:	c1 fb 02             	sar    ebx,0x2
    1138:	01 d8                	add    eax,ebx
    113a:	d1 f8                	sar    eax,1
    113c:	74 14                	je     1152 <register_tm_clones+0x42>
    113e:	8b 92 2c 00 00 00    	mov    edx,DWORD PTR [edx+0x2c]
    1144:	85 d2                	test   edx,edx
    1146:	74 0a                	je     1152 <register_tm_clones+0x42>
    1148:	83 ec 08             	sub    esp,0x8
    114b:	50                   	push   eax
    114c:	51                   	push   ecx
    114d:	ff d2                	call   edx
    114f:	83 c4 10             	add    esp,0x10
    1152:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1155:	c9                   	leave
    1156:	c3                   	ret
    1157:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
    115e:	66 90                	xchg   ax,ax

00001160 <__do_global_dtors_aux>:
    1160:	f3 0f 1e fb          	endbr32
    1164:	55                   	push   ebp
    1165:	89 e5                	mov    ebp,esp
    1167:	53                   	push   ebx
    1168:	e8 53 ff ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    116d:	81 c3 63 2e 00 00    	add    ebx,0x2e63
    1173:	83 ec 04             	sub    esp,0x4
    1176:	80 bb 3c 00 00 00 00 	cmp    BYTE PTR [ebx+0x3c],0x0
    117d:	75 27                	jne    11a6 <__do_global_dtors_aux+0x46>
    117f:	8b 83 20 00 00 00    	mov    eax,DWORD PTR [ebx+0x20]
    1185:	85 c0                	test   eax,eax
    1187:	74 11                	je     119a <__do_global_dtors_aux+0x3a>
    1189:	83 ec 0c             	sub    esp,0xc
    118c:	ff b3 34 00 00 00    	push   DWORD PTR [ebx+0x34]
    1192:	e8 e9 fe ff ff       	call   1080 <__cxa_finalize@plt>
    1197:	83 c4 10             	add    esp,0x10
    119a:	e8 31 ff ff ff       	call   10d0 <deregister_tm_clones>
    119f:	c6 83 3c 00 00 00 01 	mov    BYTE PTR [ebx+0x3c],0x1
    11a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    11a9:	c9                   	leave
    11aa:	c3                   	ret
    11ab:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
    11af:	90                   	nop

000011b0 <frame_dummy>:
    11b0:	f3 0f 1e fb          	endbr32
    11b4:	e9 57 ff ff ff       	jmp    1110 <register_tm_clones>

000011b9 <__x86.get_pc_thunk.dx>:
    11b9:	8b 14 24             	mov    edx,DWORD PTR [esp]
    11bc:	c3                   	ret

000011bd <main>:
    11bd:	8d 4c 24 04          	lea    ecx,[esp+0x4]
    11c1:	83 e4 f0             	and    esp,0xfffffff0
    11c4:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
    11c7:	55                   	push   ebp
    11c8:	89 e5                	mov    ebp,esp
    11ca:	53                   	push   ebx
    11cb:	51                   	push   ecx
    11cc:	83 ec 10             	sub    esp,0x10
    11cf:	e8 ec fe ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    11d4:	81 c3 fc 2d 00 00    	add    ebx,0x2dfc
    11da:	65 a1 14 00 00 00    	mov    eax,gs:0x14
    11e0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    11e3:	31 c0                	xor    eax,eax
    11e5:	83 ec 0c             	sub    esp,0xc
    11e8:	8d 83 38 e0 ff ff    	lea    eax,[ebx-0x1fc8]
    11ee:	50                   	push   eax
    11ef:	e8 5c fe ff ff       	call   1050 <printf@plt>
    11f4:	83 c4 10             	add    esp,0x10
    11f7:	83 ec 08             	sub    esp,0x8
    11fa:	8d 45 ec             	lea    eax,[ebp-0x14]
    11fd:	50                   	push   eax
    11fe:	8d 83 4f e0 ff ff    	lea    eax,[ebx-0x1fb1]
    1204:	50                   	push   eax
    1205:	e8 66 fe ff ff       	call   1070 <__isoc99_scanf@plt>
    120a:	83 c4 10             	add    esp,0x10
    120d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1210:	83 ec 0c             	sub    esp,0xc
    1213:	50                   	push   eax
    1214:	e8 47 00 00 00       	call   1260 <ditui1>
    1219:	83 c4 10             	add    esp,0x10
    121c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    121f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    1222:	83 ec 04             	sub    esp,0x4
    1225:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
    1228:	50                   	push   eax
    1229:	8d 83 52 e0 ff ff    	lea    eax,[ebx-0x1fae]
    122f:	50                   	push   eax
    1230:	e8 1b fe ff ff       	call   1050 <printf@plt>
    1235:	83 c4 10             	add    esp,0x10
    1238:	b8 00 00 00 00       	mov    eax,0x0
    123d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    1240:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
    1247:	74 05                	je     124e <main+0x91>
    1249:	e8 42 00 00 00       	call   1290 <__stack_chk_fail_local>
    124e:	8d 65 f8             	lea    esp,[ebp-0x8]
    1251:	59                   	pop    ecx
    1252:	5b                   	pop    ebx
    1253:	5d                   	pop    ebp
    1254:	8d 61 fc             	lea    esp,[ecx-0x4]
    1257:	c3                   	ret
    1258:	66 90                	xchg   ax,ax
    125a:	66 90                	xchg   ax,ax
    125c:	66 90                	xchg   ax,ax
    125e:	66 90                	xchg   ax,ax

00001260 <ditui1>:
    1260:	53                   	push   ebx
    1261:	51                   	push   ecx
    1262:	52                   	push   edx
    1263:	bb 00 00 00 00       	mov    ebx,0x0
    1268:	b9 00 00 00 00       	mov    ecx,0x0
    126d:	ba 01 00 00 00       	mov    edx,0x1
    1272:	83 f8 00             	cmp    eax,0x0
    1275:	74 0e                	je     1285 <done>
    1277:	83 f8 01             	cmp    eax,0x1
    127a:	74 09                	je     1285 <done>

0000127c <loop_start>:
    127c:	89 d3                	mov    ebx,edx
    127e:	01 ca                	add    edx,ecx
    1280:	89 d9                	mov    ecx,ebx
    1282:	48                   	dec    eax
    1283:	75 f7                	jne    127c <loop_start>

00001285 <done>:
    1285:	89 d0                	mov    eax,edx
    1287:	5a                   	pop    edx
    1288:	59                   	pop    ecx
    1289:	5b                   	pop    ebx
    128a:	c3                   	ret
    128b:	66 90                	xchg   ax,ax
    128d:	66 90                	xchg   ax,ax
    128f:	90                   	nop

00001290 <__stack_chk_fail_local>:
    1290:	f3 0f 1e fb          	endbr32
    1294:	53                   	push   ebx
    1295:	e8 26 fe ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    129a:	81 c3 36 2d 00 00    	add    ebx,0x2d36
    12a0:	83 ec 08             	sub    esp,0x8
    12a3:	e8 b8 fd ff ff       	call   1060 <__stack_chk_fail@plt>

Disassembly of section .fini:

000012a8 <_fini>:
    12a8:	f3 0f 1e fb          	endbr32
    12ac:	53                   	push   ebx
    12ad:	83 ec 08             	sub    esp,0x8
    12b0:	e8 0b fe ff ff       	call   10c0 <__x86.get_pc_thunk.bx>
    12b5:	81 c3 1b 2d 00 00    	add    ebx,0x2d1b
    12bb:	83 c4 08             	add    esp,0x8
    12be:	5b                   	pop    ebx
    12bf:	c3                   	ret
