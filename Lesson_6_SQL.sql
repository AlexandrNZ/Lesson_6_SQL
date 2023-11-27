```
1 Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
```
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE result VARCHAR(255);
    
    -- Вычисляем количество дней
    DECLARE days INT;
    SET days = seconds / (60 * 60 * 24);
    SET seconds = seconds % (60 * 60 * 24);
    
    -- Вычисляем количество часов
    DECLARE hours INT;
    SET hours = seconds / (60 * 60);
    SET seconds = seconds % (60 * 60);
    
    -- Вычисляем количество минут
    DECLARE minutes INT;
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    
    -- Формируем результат
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN result;
END;

```
Вы можете вызвать эту функцию и передать ей количество секунд, чтобы получить отформатированную строку. Например:
```
sql
SELECT format_seconds(123456);

```
В результате выполнения этого запроса будет получена строка `'1 days 10 hours 17 minutes 36 seconds'`.
```
```
2 - Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
```
SELECT num
FROM (SELECT UNNEST(ARRAY[1,2,3,4,5,6,7,8,9,10]) AS num) AS nums
WHERE num % 2 = 0;