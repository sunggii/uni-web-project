# Project 2 - Web E-commerce 

สรุปโปรเจค
- โปรเจคนี้เป็นเว็บแอปพลิเคชันที่พัฒนาโดยใช้ Java EE (JSP/Servlet) สำหรับจัดการฟังก์ชันของระบบขายสินค้า/สต็อก/คำสั่งซื้อ (ตัวอย่างไฟล์ใน `web/` และ `serverSide/`) และมีหน้า client-side ที่ใช้ HTML/CSS/JavaScript

คุณสมบัติหลัก (ตัวอย่าง)
- หน้าหลัก: `index.jsp`
- ระบบล็อกอิน/สมัครสมาชิก: อยู่ใน `clientSide/login/`
- ตะกร้าสินค้า: `clientSide/cart/viewCart.jsp` และส่วนประกอบ modal
- หน้าจอจัดการสต็อก, คำสั่งซื้อ, การชำระเงิน, โปรโมชั่น อยู่ใต้ `serverSide/`

โครงสร้างโปรเจค (สำคัญ)
- `web/` : โฟลเดอร์เว็บแอป (JSP, JS, CSS, รูปภาพ, components)
- `src/java/` : โค้ด Java (แพ็กเกจ `com.bean`, `com.dao`, `com.servlet`) — ที่เก็บ Bean, DAO และ Servlet
- `WEB-INF/` : การตั้งค่าเว็บ, `web.xml` หรือ `glassfish-web.xml` (ดูใน `web/WEB-INF/`)
- `nbproject/` : ไฟล์โปรเจค NetBeans (เปิดด้วย NetBeans ได้เลย)
- `build.xml` : สคริปต์ Ant สำหรับ build/deploy

เทคโนโลยีที่ใช้
- Java (JDK) : ภาษาหลักสำหรับฝั่งเซิร์ฟเวอร์ (Servlets และ Business logic)
- JSP (JavaServer Pages) : สำหรับสร้างหน้า HTML แบบไดนามิก
- Servlet : จัดการ request/response และเชื่อมต่อกับ DAO
- JDBC/DAO : การเชื่อมต่อฐานข้อมูลผ่าน DAO pattern (ตรวจสอบโค้ดใน `src/java/com/dao`)
- HTML / CSS / JavaScript : ฝั่ง client — มีไฟล์ `index.js` และ `style.css`
- Ant (`build.xml`) : สคริปต์สำหรับ build/deploy อัตโนมัติ
- GlassFish (หรือ Java EE container ที่รองรับ) : ใช้ไฟล์ `glassfish-web.xml` ใน `WEB-INF` — โครงการนี้เตรียมสำหรับรันบน GlassFish
- NetBeans : โปรเจคมีโฟลเดอร์ `nbproject` จึงสามารถเปิดและรันโดยตรงผ่าน NetBeans

การติดตั้งและรัน (อย่างย่อ)
1. ติดตั้ง JDK (แนะนำ JDK 8 หรือ JDK ที่โครงการรองรับ)
2. ติดตั้ง Apache Ant (ถ้าจะใช้ `ant`)
3. ติดตั้ง GlassFish หรือแอปเซิร์ฟเวอร์ที่รองรับ Java EE
4. วาง JDBC driver (เช่น `mysql-connector-java.jar`) ไว้ใน `web/WEB-INF/lib` (หรือเพิ่มใน server libs)

Build และ deploy ด้วย Ant (PowerShell ตัวอย่าง)
```powershell
# เปิด PowerShell ในโฟลเดอร์โปรเจค (ที่มี build.xml)
cd 'D:\ru_68\cos2204\project_2\my_project_2'
ant
```

หรือ
- เปิดด้วย NetBeans: เลือก `Open Project` -> เลือกโฟลเดอร์โปรเจค -> Run
- หรือสร้างไฟล์ WAR แล้ว deploy ผ่าน GlassFish Admin Console

การตั้งค่าฐานข้อมูล
- ตรวจสอบโค้ด DAO ใน `src/java/com/dao` เพื่อดูค่าการเชื่อมต่อ (URL, user, password)
- ถ้ามีไฟล์ config โปรดแก้ค่าการเชื่อมต่อที่นั่น หรือแก้ใน servlet/DAO ตามที่โค้ดกำหนด
- อย่าลืมวาง JDBC driver ใน `WEB-INF/lib` หรือติดตั้งเป็น library ของ GlassFish

ข้อควรระวังและคำแนะนำ
- โปรเจคนี้มีไฟล์ `nbproject` และ `build.xml` ซึ่งชี้ว่าโครงการถูกพัฒนาใน NetBeans — หากใช้ IDE อื่น ให้ตั้งค่า build/deploy ให้ตรงกัน
- หากพบปัญหาเกี่ยวกับการเชื่อมต่อ DB ให้ตรวจสอบ logs ของ GlassFish และ stacktrace ที่แสดงในหน้า error

ไฟล์สำคัญที่ควรดู
- `web/index.jsp` - หน้าแรกของเว็บ
- `web/WEB-INF/glassfish-web.xml` - การตั้งค่าสำหรับ GlassFish
- `src/java/com/dao/` - DAO (การเชื่อมต่อ DB)
- `src/java/com/servlet/` - Servlets (จุดเข้า-ออกของ request)

ผู้พัฒนา
- โปรเจคนี้เป็นงานโปรเจคการเรียน/ตัวอย่าง (ปรับแต่งเพิ่มเติมได้ตามความต้องการ)

หากต้องการให้ผมปรับ README เพิ่มเติม (เช่น ตัวอย่าง SQL schema, ตัวอย่างไฟล์ config, คำอธิบายแต่ละ servlet) แจ้งมาได้เลยครับ

**การ deploy บน Render (แนะนำใช้ Docker)**

- ปัญหาที่พบ: ข้อความ error `Couldn't find a package.json file in "/opt/render/project/src"` เกิดเพราะ Render พยายามรัน environment แบบ Node (หรือสคริปต์ build ที่เรียก `yarn`) โดยอัตโนมัติ เมื่อไม่มี `package.json` จึงเกิดข้อผิดพลาด
- วิธีแก้ที่แนะนำ: ใช้ Dockerfile เพื่อให้ Render สร้างและรันแอปของเราแบบ containerized (ไม่ต้องพึ่ง `package.json`). โปรเจคนี้มีสคริปต์ Ant ที่สร้าง WAR ได้ ดังนั้น Dockerfile จะสร้าง WAR ด้วย Ant (ดาวน์โหลด GlassFish ชั่วคราวเพื่อให้ build script ทำงาน) แล้วรันบน Tomcat

ขั้นตอนสั้น ๆ ในการใช้งานกับ Render
1. เพิ่ม `Dockerfile` ที่รูทของโปรเจค (ผมได้เพิ่มตัวอย่างไว้แล้วใน repo) ซึ่งจะทำการ
	- ติดตั้ง Ant และ GlassFish ชั่วคราวใน stage แรก
	- รัน `ant dist` เพื่อสร้าง WAR ที่ `dist/` 
	- คัดลอก WAR ไปยัง Tomcat image และรัน Tomcat
2. ตรวจสอบว่า JDBC driver (เช่น `mysql-connector-j-9.0.0.jar`) อยู่ใน `web/WEB-INF/lib` (ผมได้เปลี่ยน reference ใน `nbproject/project.properties` ให้ชี้ไปที่ `web/WEB-INF/lib/...` แล้ว)
3. commit และ push โค้ดขึ้น repository ที่เชื่อมกับ Render (หรือใช้ Docker build จาก Render directly)
4. บน Render สร้างบริการใหม่เป็น `Web Service` และเลือก `Docker` (หรือเชื่อมกับ Git และเลือกให้ Render ใช้ `Dockerfile` ใน repo)

คำสั่งทดสอบแบบ local (PowerShell)
```powershell
# สร้าง image และรัน container (ต้องมี Docker ติดตั้ง)
cd 'D:\ru_68\cos2204\project_2\my_project_2'
docker build -t my_project_2:latest .
docker run -p 8080:8080 my_project_2:latest

# เปิดเบราว์เซอร์ที่ http://localhost:8080
```

หมายเหตุสำคัญ
- ถ้า `web/WEB-INF/lib/mysql-connector-j-9.0.0.jar` ยังไม่มี ให้ดาวน์โหลด `mysql-connector` แล้ววางไว้ที่นั่นก่อน build (หรือใช้ dependency management แยกต่างหาก เช่น Maven/Gradle)
- หากต้องการให้ Render เชื่อมต่อฐานข้อมูล ให้ตั้งค่า environment variables บน Render (`DB_URL`, `DB_USER`, `DB_PASS`) แล้วแก้ servlet/DAO ให้อ่านค่าจาก environment หรือจากไฟล์ properties ที่อ่านค่าจาก env
- การดาวน์โหลด GlassFish ใน Dockerfile ใช้เพียงเพื่อให้ NetBeans-generated Ant build ทำงาน ถ้าต้องการลดขนาด image ใน production สามารถปรับปรุงขั้นตอน build ให้ไม่ต้องอาศัย GlassFish (เช่นเปลี่ยนเป็น Maven หรือคัดลอก dependencies แบบ explicit)

ต้องการให้ผมช่วยอีกไหม เช่น
- ปรับ `Servlet`/`DAO` ให้รับค่าการเชื่อมต่อจาก environment variables
- ดาวน์โหลด `mysql-connector` และเพิ่มเข้า `web/WEB-INF/lib` ให้เลย
- สร้าง `render.yaml` ตัวอย่างสำหรับการตั้งค่าอัตโนมัติบน Render
