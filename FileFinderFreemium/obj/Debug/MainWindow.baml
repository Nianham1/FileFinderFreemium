   M S B A M L   `   `   `  ����M  IFileFinderFreemium, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:FileFinderFreemiumFileFinderFreemium  5   	   #    FileFinderFreemium.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:FileFinderFreemium     5   	     � Title$  File Finder Freemium��5   	   $	��860��6&   $
��1536��63    � 
ResizeMode$ CanMinimize=�6@    J� Opacity$ 0.9         Q�6Y    � Icon$ /FileFinderFreemium.PNG��5	      ���	#FF574B90.��5
      �  � ColumnDefinitions 5   
   �� 5      $
��622* �6   �� 5      $	��29* �6   �� 5      $	��70* �6   �� 5      $
��815* �6    � RowDefinitions 5   
   �� 5      $��80 �6   �� 5      $	��120 �6   �� 5      $	��120 �6   .+�5   
   �� -   5         ��Name$ FileFilderTabButton��5      $��File Finder��6.   $��10,-6,464,56q�6D   $��0��6Z   ���	#FF786FA6���	#FFFBFBFB���	#FFFDFDFD$
��Bold"�6�   $��14(�6�    � 	Resources 5       �� 
TargetType	 �� Property
 �� Value��%^   '��       �� 5      " ��6   .�5      �� 	 �@��CornerRadius$
 5��65   5      5      5      �� 5   
   -   5        $ 
Tab2Button��5      $��	Blank Tab��6&   $��164,-6,310,56q�6S   $��0��6j   ���	#FF786FA6���	#FFFBFBFB���	#FFFDFDFD$��14(�6�   $
��Bold"�6�    5      ��%^   '��       �� 5       " ��6   .�5!      �� 	 �@��CornerRadius$
 5��65   5"      5#      5$      �� 5&   
   $��Selected Directory:��6   $��Right=�6.   $
��Left=�6Q   ���	#FFFDFDFD$	��Top=�6�   $	��194��6�   $��1��6�    J� RenderTransformOrigin$ 0.422,-1.732&�6�   $
��Bold"�6�   �� 5(   
   $��Date Range:��6   $��Right=�6&   $
��Left=�6I   $��0,74,0,0q�6d   ���	#FFFDFDFD$	��Top=�6�   $	��194��6�   $��1��6�   $ 1.106,0.348&�6�   $
��Bold"�6�   �� 5)   
   $��Start��6   $
��Left=�6    $��
210,73,0,0q�6;   $	��Top=�6O   $��90��6g   $��1��6r   ���	#FFFDFDFD$ 1.106,0.348&�6�   ���	#FF786FA6$��24��6�   �� 5*   
   $	��End��6   $
��Left=�6   $��
392,73,0,0q�69   $	��Top=�6M   $��90��6e   $��1��6p   ���	#FFFDFDFD$ 1.106,0.348&�6�   ���	#FF786FA6$��24��6�   �� 5,   
   $��File Filter:��6   $��Right=�6'   $
��Left=�6J   ���	#FFFDFDFD$��Center=�6|   $	��194��6�   $��1��6�   $ 1.106,0.348&�6�   $
��Bold"�6�   $��	0,37,0,60q�6�   �� 5-   
   -   5         ��Name$ FileFilterTextBox��5-      $��*��6-    �� TextAlignment$ Right=�66    �� TextWrapping$
 Wrap=�6L   $��1��6`   $��210,41,100,60q�6m   ���	#FF786FA6���	#FF786FA6���	#FFFDFDFD$��20��6�   (  "System.Windows.Controls.DatePicker  5/   
   -   5          Name$ StartDateDatePicker��5/      $��1��62   $��242,73,252,23q�6?   ���	#FF786FA6$��25��6m   51      �� 52   
   -   5        $
��Find��52      $��1��6    $
��Left=�6-   $��500,62,0,13q�6H   $	��106��6]   $��3��6i   ���	#FF786FA6���	#FFFDFDFD���	#FFFBFBFB6�     53   
   -   5        $ EndDateDatePicker��53      $��1��60   $��421,73,79,23q�6=   ���	#FF786FA6$��25��6j   54      &   System.Windows.Controls.DataGrid  55   
   -   5          Name$ FileFinderDataGrid��55      $��2��6/   $��4��6<   $��10,10,10,-479q�6P   ���	#FF786FA6   AutoGenerateColumns .     AlternatingRowBackground �	#FFBAB1EA   
IsReadOnly .    SelectionUnit$
 Cell=�6�      Columns 56      0  *System.Windows.Controls.DataGridTextColumn  57      ,  &System.Windows.Controls.DataGridColumn   Header$ 	Full Path��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 300 58   C   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6!   ��  �� Path$ fullPath�59        5:      $ Folder��6%   $	 300 5;   A    6!   �� $ folder�5<        5=      $ 	File Name��6%   $	 200 5>   C    6!   �� $ fileName�5?        5@      $ 	Extension��6%   $	 100 5A   D    6!   �� $ 	extension�5B        5C      $ File Size (bytes)��6%   $	 200 5D   C    6!   �� $ fileSize�5E        5F      $ Last Modified��6%   $
 100* 5G   G    6!   �� $ lastModified�5H      5K      �� 5L   
   -   5        $ FileExtensionHelpButton��5L      $��?��62   $
��Left=�6>   $	��Top=�6Y   $��18��6q   $��
545,41,0,0q�6|   $��1��6�   ���	#FF786FA6���	#FFFDFDFD$��20��6�   6�   �� 5M   
   -	   5        $ DateRangeHelpButton��5M      $��?��6.   $
��Left=�6:   $	��Top=�6U   $��18��6m   $��
545,76,0,0q�6x   $��1��6�   ���	#FF786FA6���	#FFFDFDFD$��20��6�   6�   �� 5N   
   $
��Stop��6   $��1��6    $
��Left=�6-   $��637,62,0,13q�6H   $	��106��6]   $��3��6i   ���	#FF786FA6���	#FFFDFDFD���	#FFFBFBFB6�   �� 5P   
   -
   5        $ FileFinderStatusBar��5P      $��Center=�6/   $
��Left=�6S   $��18��6n   $��10,600,0,-517q�6z   $��2��6�   $
 Wrap=�6�   $	��Top=�6�   $	��197��6�   ���	#FF786FA6���	#FFFDFDFD6�   �� 5Q   
   -   5        $ SelectDirTextBox��5Q      $�� ��6,   $ Right=�64   $
 Wrap=�6J   $��1��6^   $��210,4,100,97q�6k   ���	#FF786FA6���	#FF786FA6���	#FFFDFDFD$��20��6�   �� 5R   
   -   5        $��Select��5R      $
��Left=�6"   $��
524,4,0,97q�6=   $��39��6Q   ���	#FF786FA6���	#FFFDFDFD���	#FFFBFBFB$��1��6�   5T      5U      