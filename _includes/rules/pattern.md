## 4.模式规范


### 4.1 复杂度


代码检测工具在扫描后进行代码复杂度的统计和计算，为限制代码过于复杂，定义的指标如下：

-   单行的逻辑操作符不超过5个

-   方法数不超50，类行数不超1500，文件不超2000

-   圈复杂度不超过12, 其中复杂度是逻辑判断及循环数量的和

-   路径复杂度不能超过200

-   for循环嵌套不超过三层

-   If判断不超过三层

-   try-catch不超过两层

### 4.2 Object类


java.lang.Object类是其它所有类的基类，在使用及覆盖其定义的clone, equals, hashCode, finalizer等方法时有一些需要注意的事项，如果不遵守会导致代码执行结果异常却很难发现问题原因。如下是一些不良的使用模式，代码扫描工具会将匹配的代码作为问题标识。

-   Equals 方法不应对参数类型有任何假定

-   类实现了Cloneable, 但没有定义和使用clone方法

-   clone 并没有调用super.clone()

-   类定义了clone但没有实现Cloneable

-   应使用预定义过的众所周知的常量比如Math.PI

-   抽象类中的compareTo方法的参数类型应该是Object

-   抽象类中的equals方法的参数类型应该是Object

-   equals方法中检查参数的类型是否兼容的操作

-   定义了compareTo但却使用了Object.equals，可能破坏规则：当且仅当equals返回true时，compareTo的值才应返回零。

-   equals可能被派生出的子类型破坏

-   重写的方法equals的参数类型应该是Object

-   应该删除空的finalizer 方法

-   finalizer 仅应该被VM调用，不要在代码中显示调用

-   不要在finalizer 重置属性为null

-   发现finalizer仅设置了属性为null

-   finalizer 未调用super.finalizer

-   finalizer导致super.finalizer无效

-   finalizer仅调用super.finalizer，删除它

-   类中重写了equals但没有重写hashCode

-   类中重写了equals但调用了Object.hashCode()

-   类定义了hashCode但未重写equals()

-   类定义了hashCode但使用了 Object.equals()

-   从抽象父类继承了equals,但使用了 Object.equals()

-   Clone不应该返回一个null

-   equals方法未检查参数是否为null

-   toString不应该返回null

### 4.3 Serializable类


实现java.io.Serializable接口的类及操作，需要关注如下的缺陷模式。

-   在HttpSession中保存了非序列化的对象

-   在Serializable 中有非变化的非可序列化的属性

-   非Serializable 有一个非Serializable 的内部类

-   非Serializable 的值存储在Serializable 的类实例属性中

-   Serializable的类是内部类，序列化要既对内部类也对外部类

-   Comparator 没有实现Serializable 接口

-   serialVersionUID 应该定义为final的

-   serialVersionUID 应该定位Long类型

-   serialVersionUID 应该是Static的

-   类是Serializable 的，但没有定义void的构造方法

-   类是Externalizable 的，但没有定义void的构造方法

-   readResolve 方法的返回类型应该是Object

-   可变的属性没有被反序列化，导致使用了缺省值

-   Serializable的类，没有定义serialVersionUID

-   如果类被扩展k可能导致使用GetResouce是不安全的

### 4.4 多线程并发


多线程在同步和并发处理中的一些容易导致错误结果出现的模式如下。

-   代码中包含对并发抽象的一系列调用，这些调用未被原子的执行

-   可能有对属性的双重检查锁

-   可能出现部分初始化类的暴露

-   在Boolean常量上的同步控制会导致死锁

-   在装箱基本类型常量(比如Integer)是的同步会导致死锁

-   对被内控共享(interned)的String的同步会导致死锁

-   在装箱基本类型值(比如Integer)是的同步会导致死锁

-   在Condition 上执行了wait而不是执行了await()

-   用默认的空run方法创建了线程

-   使用了空的同步块

-   不一致的同步控制，比如加锁和非加锁访问的混用

-   属性未被并发访问保护

-   对锁的同步应该使用synchronized而不是 acquire()/release()

-   在util.concurrent实例上执行了同步

-   对同时提供await（）、signal（）、signalAll（）方法的对象调用了wait（）、notify（）或notifyAll（）

-   包含非易失性(non-volatile)静态字段的非同步的延迟初始化

-   静态字段的延迟初始化和更新不正确

-   在对可变字段引用的对象上进行同步, 同步控制是无作用的

-   可变servlet字段导致访问竞争

-   调用了notify/notifyAll但却没有执行过锁定操作

-   调用wait却没有执行过lock

-   对notify（）或notifyAll（）的调用但未附带对可变对象状态的任何（明显）修改

-   对同个字段进行同步和为null的检查

-   使用了notify而不是notifyAll

-   serializable 类中readObject方法被做了同步控制

-   调用了Threa中的run方法，应该是使用start

-   在构造方法中执行了线程启动

-   在循环中读取字段，并以此作为退出条件，可能会因编译器的处理陷入死循环。

-   调用静态的Calendar，它并非线程安全

-   调用静态的DateFormat ，它并非线程安全

-   静态的Calendar

-   静态的DateFormat

-   持有锁调用了Thread.sleep（）

-   持有两个锁执行wait

-   get方法未同步控制，set方法是同步控制的

-   并非所有路径都执行对锁的释放

-   并非在所有exception中对锁执行释放

-   无条件等待

-   对可变字段的递增未做同步控制

-   对数组的volatile引用不会将数组元素视为volatile

-   在getClass而不是class字面上进行同步控制

-   类的writeObject方法是同步的，其它方法不是

-   Condition.await() 不是在循环内

-   wait 未在循环内可能错失等待的条件

### 4.5 集合类

和集合(Collection)相关的错误模式如下。

-   因重复使用Entry对象，添加EntrySet可能会出现失败

-   删除Collection中所有项时，要用clear而不是removeAll

-   在集合中关于泛型的调用中没有类型检查

### 4.6 脆弱代码

脆弱代码往往是违反了面向对象的封装性，形成了模块间的内部数据的直接访问等耦合，因而容易出现因数据被不可控的改变而导致结果难以预料，如下是一些相关的错误模式。

-   通过返回对可变对象的引用暴露了内部表示

-   通过与可变对象引用的合并暴露了内部表示

-   finalizer应该是protected, 不是public

-   将对外部可变对象的引用存储到静态字段中暴露内部的静态状态

-   public静态方法返回对数组的引用，而它本是作为类的static状态的一部分被暴露了

-   字段应该通过final或package protected进行访问限制

-   可变集合的实例被赋值给final的静态字段

-   可变集合类型的字段应该是package protected

-   字段是可变的Hashtable

-   字段应该移出interface且package protected

-   可变的静态字段须是package protected

-   static public的字段应该是final的

-   通过设置字段为final,避免静态initilizer包含多个对字段的写入

### 4.7 安全漏洞


如下的一些错误模式会导致系统被侵入，攻击者可通过安全漏洞侵入和控制系统，并窃取数据。

-   常量硬编码数据库密码

-   空的数据库密码

-   从不可信的输入生成 HTTP cookie

-   HTTP响应拆分攻击

-   不受限制的servlet中的绝对路径遍历

-   不受限制的servlet中的相对路径遍历

-   传递给SQL语句上的execute或addBatch方法的非常量字符串

-   prepared 的语句由非常量产生

-   JSP 跨站脚本攻击XSS

-   Servlet在错误页中跨站点脚本漏洞

-   Servlet跨站点脚本漏洞

### 4.8 危险的代码


在编写代码时，如果有过多的限于当时特定情况的假设，会形成危险的代码，它们在超出当初的假定后结果异常，以下是扫描工具识别为存在疑问的代码模式。

-   可疑的向abstract collection的强制类型转换

-   可疑的向具体 collection的强制类型转换

-   未检查的/不确定的强制类型转换

-   未检查的/不确定地对方法返回值的强制类型转换

-   Unsigned 右移强转为 short/byte

-   方法中两个分支用了同样的代码

-   代码中包含了硬编码方式引用的绝对路径的

-   非serializable 对象被写向ObjectOutput

-   调用substring(0)，返回原字符串

-   非布尔型参数用%b格式化输出

-   存在循环初始化

-   整数相除的结果被转为double/float

-   整数相乘结果被转为long

-   参数必须为non-null 但被标记为nullable

-   使用非短路逻辑的潜在风险，比如&或 \|  

-   可疑的非短路逻辑的使用

-   应考虑返回零长度数组而不是返回null

-   在Exception不再被抛出时，(所有类型)Exception被捕获到而不能区别处理

-   类冗余的实现和超类相同的接口

-   方法检查String.indexOf的结果是否为正，应检查是否为负

-   通过32位随机有符号整数的余数计算随机数

-   switch中某case语句缺少了break

-   switch中缺少了defaut

-   通过实例的方法更新了static的字段

-   无用的控制流

-   无用的到下一行的控制流

-   未被使用过的public或protected字段

-   字段未在构造方法中初始化，在间接引用时未做非空检查

-   方法直接分配xml接口的特定实现
