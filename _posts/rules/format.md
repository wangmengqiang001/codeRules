## 3.格式规范

### 3.1 一般性原则

-   一个程序文件最好不要超过２5０0行(含注释)

-   如果是大括号内为空，则简洁地写成{}即可，大括号中间无需换行和空格；如果是非空代码块则： 1） 左大括号前不换行。 2） 左大括号后换行。 3） 右大括号前换行。 4） 右大括号后还有else等代码则不换行；表示终止的右大括号后必须换行。

-   采用4个空格缩进，禁止使用Tab字符，或者将Tab字符设置成4个

### 3.2 注释

#### 3.2.1 一般性规则

-   注释应该使代码更加清晰易懂

-   注释要简单明了，只要提供能够明确理解程序所必要的信息就可以了。如果注释太复杂说明程序需要修改调整，使设计更加合理。

-   注释不仅描述程序做了什么，还要描述为什么要这样做,以及约束

-   对于一般的getter、setter方法不用注释

-   注释不能嵌套

-   生成开发文档的需要用中文编写

#### 3.2.2 类/接口注释

类/接口的注释必须使用Javadoc规范，使用/\*\*内容\*/格式。按照常用的说明顺序排列，主要包括：

-   类的主要说明，类设计的目标，完成什么样的功能

-   &lt;Strong&gt;主要的类使用&lt;/Strong&gt;如何使用该类, 包括环境要求,如是否线程安全,并发性要求, 以及使用约束

-   @version版本说明

-   @author作者

-   @date日期

-   @see参照

-   @since开始版本等信息如


```java

/**

* This class provides default implementations for the JFC <code>Action</code>

* interface. Standard behaviors like the get and set methods for

* <code>Action</code> object properties (icon, text, and enabled) are defined

* here. The developer need only subclass this abstract class and

* define the <code>actionPerformed</code> method.

* <p>

* <strong>Warning:</strong>;

* Serialized objects of this class will not be compatible with

* future Swing releases. The current serialization support is appropriate

* for short term storage or RMI between applications running the same

* version of Swing. A future release of Swing will provide support for

* long term persistence.

*

* @version 1.41 02/02/00

* @author Georges Saab

* @see Action

*/
```


为了使形成的文档可读性好，注释中经常带有缩进和格式控制。类描述放在类的类定义的紧前面，不能有任何的空行。

#### 3.2.4 变量注释

-   成员变量、类静态变量采用/\*\*内容\*/格式，对变量的意义进行注释。

如:

```java
/**

* Web.xml文件中configServlet参数的UIAPP.xml initparam

*/

public final static String APP_CONFIG = "aaa.uiapp";
```

-   局部变量采用//或者/\*内容\*/格式，对变量的意义进行注释。

 如：

```java
void func() {

int i; //用于循环计数

…………

}
```

#### 3.2.5 方法注释

方法注释采用/\*\*内容\*/格式，一般包括:

-   方法的主要说明

-   @param 参数说明

-   @return 返回值说明

-   @throws 异常说明

-   @see如果重载方法必须参考父类的方法

-   @date 日期

-   @author作者

```java
/**

* 返回授权验证信息

* @param httpResponse HTTP请求Response

* @param message 授权验证信息说明

* @throws IOException IO异常

* @return 认证信息

* @date 2021年6月22日 上午10:45:03

* @author admin

*/

private String returnAuthMessage(ServletResponse response, String message)throws IOException {
```

#### 3.2.7 修改记录

修改记录放在类的文件头说明中，一般为&lt;修改人&gt; + &lt;修改日期&gt; + &lt;-&gt; + &lt;修改描述&gt;。

```Java
//<修改人> <修改日期:格式YYYY-MM-DD> <修改描述>;

// 张三 2009-06-24 添加 在删除分析模型时，如果是市县一体化系统，同时删除共享表中的记录

if (isTableExisted("aud_sharedanalymodel")) {

    String where = " pk_analymodel ='"+ model.getAnalyTableVO().getPrimaryKey()+"'";

    m_daoProxy.deleteByClause(SharedAnalyModelVO.class, where);

}

// 处理后续工作
```


### 3.2 类


-   类的结构组织，一般按照如下的顺序：

> 1.  常量声明
>
>2.  静态变量声明
>
>3.  成员变量声明
>
>4.  构造方法部分
>
>5.  成员方法部分
>
>6.  静态方法部分
>
>7.  内部类

-   类声明时，要指出其访问控制权限，一般为public，没有修饰符（即default），或者private。

### 3.3 变量


-   成员变量声明时, 要指出其访问控制权限，尽量采用private

-   每一个变量声明/定义占一行（参数变量除外），如：

```java
int a;

int b;
```

> 比int a,b; 更容易读, 更容易查找bug

-   局部变量在使用前必须初始化，一般在声明时初始化

-   变量的声明要放在程序块的开始位置

> 如：

```java
void myMethod() {

  int int1 = 0; // beginning of method block

  if (condition) {

    int int2 = 0; // beginning of "if" block

    ...

  }

}
```
-   数组的申明采用 &lt;数据类型\[\] + 变量名&gt;方式如：

```java
char[] buffer;
```


> 而不是：

```java
char buffer[];
```


### 3.4 方法


-   对成员方法,不要轻易的采用public的成员变量。

-   空方法中方法声明和方法体可都在一行。如：void func(){}

-   方法和方法之间空一行

-   方法的注释放在方法的紧前面，不能空一行。

-   方法参数在定义和传入时，多个参数逗号后面必须加空格

-   避免过多的参数列表，尽量控制在５个以内，若需要传递多个参数时，当使用一个容纳这些参数的对象进行传递，以提高程序的可读性和可扩展性

-   方法中的循环嵌套尽量不能超过２层

-   if/for/while/switch/do等保留字与括号之间都必须加空格

-   二目、三目运算符的左右两边都需要加一个空格

-   每个方法代码行数尽量不要超过100行（有效代码行，不包括注释），但必须保证逻辑的完整性

**注：代码格式的示例可参见附件中的《代码规范示例》**
