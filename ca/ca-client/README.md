本文件夹是fabric-ca-client的使用配置及生成结果
* admin-ca：保存fabric-ca-server的admin证书
* cert: 保存本项目生成的所有证书，私钥保存为.key, 证书保存为.crt文件
* fabric-ca-client: 客户端程序
* fabric-ca-client-config.yaml： fabric-ca-client的配置


本项目申请证书的相关命令如下, 每次证书生成后，手工拷贝到cert下，并重命名: 私钥保存为.key, 证书保存为.crt文件


```
export FABRIC_CA_CLIENT_HOME=$PWD


#Network:
#admin-ca-orgA:
./fabric-ca-client enroll -d -u https://admin-ca-orgA:admin-ca-orgApw@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp


#orderer1-orgA:
./fabric-ca-client register -d --id.name orderer1-orgA --id.secret orderer1-orgAPW --id.type orderer -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp
./fabric-ca-client enroll -d -u https://orderer1-orgA:orderer1-orgAPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./tmp

#orderer2-orgA:
./fabric-ca-client register -d --id.name orderer2-orgA --id.secret orderer2-orgAPW --id.type orderer -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp
./fabric-ca-client enroll -d -u https://orderer2-orgA:orderer2-orgAPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./tmp


#admin-orgA
./fabric-ca-client register -d --id.name admin-orgA --id.secret admin-orgAPW --id.type admin -u https://127.0.0.1:7152  --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp
./fabric-ca-client enroll -d -u https://admin-orgA:admin-orgAPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./tmp


#peer1-orgA
./fabric-ca-client register -d --id.name peer1-orgA --id.secret peer1-orgAPW --id.type peer -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp
./fabric-ca-client enroll -d -u https://peer1-orgA:peer1-orgAPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./tmp



#admin-ca-orgB:
./fabric-ca-client enroll -d -u https://admin-ca-orgB:admin-ca-orgBpw@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./admin-ca/orgB/msp


#orderer1-orgB:
./fabric-ca-client register -d --id.name orderer1-orgB --id.secret orderer1-orgBPW --id.type orderer -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./admin-ca/orgB/msp
./fabric-ca-client enroll -d -u https://orderer1-orgB:orderer1-orgBPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./tmp


#admin-orgB
./fabric-ca-client register -d --id.name admin-orgB --id.secret admin-orgBPW --id.type admin -u https://127.0.0.1:7152  --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./admin-ca/orgB/msp

./fabric-ca-client enroll -d -u https://admin-orgB:admin-orgBPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./tmp

#peer1-orgB
./fabric-ca-client register -d --id.name peer1-orgB --id.secret peer1-orgBPW --id.type peer -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./admin-ca/orgB/msp
./fabric-ca-client enroll -d -u https://peer1-orgB:peer1-orgBPW@127.0.0.1:7152 --tls.certfiles ./admin-ca/orgB/root-orgB.crt  --mspdir  ./tmp


#删除用户
./fabric-ca-client identity remove peer1-orgA -u https://127.0.0.1:7152 --tls.certfiles ./admin-ca/orgA/root-orgA.crt  --mspdir  ./admin-ca/orgA/msp

```



