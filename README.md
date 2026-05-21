## my-first-devops

Меня зовут Епифанцев Евгений Максимович и эта репозитория создана в рамках 
заданий для IT-компании NST


## Среда выполнения 

- **ОС:** Ubuntu 22.04 LTS (VirtualBox)

- **Git:** настроен через SSH-ключи

- **GitHub:** публичный репозиторий `my-first-devops`


## Выполненные задачи


### Часть 1: Установка Git и создание аккаунта GitHub

- Установлен Git: `sudo apt install git -y`

- Создан аккаунт на [GitHub](https://github.com)

- Сгенерирован SSH-ключ (`ed25519`) и добавлен в аккаунт GitHub

- Проверка подключения: `ssh -T git@github.com`


### Часть 2: Создание репозитория

- Создан публичный репозиторий `my-first-devops`

- Клонирован локально: `git clone git@github.com:username/my-first-devops.git`

- Создан `README.md` и залит на GitHub


### Часть 3: Выполнение заданий

#### Задание 1 — Systemd-сервис

**Файлы**

- `alive.py` — Python-скрипт, каждые 10 секунд пишет в syslog "I am alive"

- `alive.service` — systemd-юнит с ограничениями


**Команды**

`sudo systemctl start alive.service`

`sudo systemctl stop alive.service`

`sudo systemctl status alive.service`

`sudo journalctl -u alive.service -f`


**Проблемы**

При запуске сервиса возникала ошибка status=2. Причина — конфликт shebang в скрипте.

Решение: удалена первая строка #!/usr/bin/python3, так как интерпретатор явно указан в ExecStart.


#### Задание 2 — Настройка firewall (iptables)

**Файлы**

`firewall_rules.sh` — применение правил

`firewall_save.sh` — сохранение правил

`iptables-restore.service` — восстановление после перезагрузки


**Правила**

- Запрещены все входящие, кроме уже установленных (ESTABLISHED,RELATED)

- Разрешён SSH только с 192.168.1.100 (для теста использован 127.0.0.1)

- Разрешены все исходящие соединения

- Настроено перенаправление порта 8080 → 80


**Команды Проверки**

`sudo python3 -m http.server 80`

`curl http://localhost:8080`


#### Задание 3 — LVM

**Шаги**

1. Добавлен диск `/dev/sdb` (10 ГБ)

2. Создан PV: `pvcreate /dev/sdb`

3. Создана VG: `vgcreate my_vg /dev/sdb`

4. Создан LV: `lvcreate -L 8G -n my_lv my_vg`

5. Форматирование и монтирование: `mkfs.ext4` + `mount`

6. Добавлен второй диск `/dev/sdc` (10 ГБ)

7. Расширение VG: `vgextend my_vg /dev/sdc`

8. Расширение LV и ФС: `lvextend -r -l +100%FREE /dev/my_vg/my_lv`


**Проблемы**

При попытке использовать `/dev/sda3` возникла ошибка `Can't open exclusively. Mounted filesystem?`.

Решение: для экспериментов добавлены отдельные диски `/dev/sdb` и `/dev/sdc`.


###Заключение

Все три задания выполнены:

1. Systemd-сервис работает с ограничениями

2. Файрвол настроен и сохраняется после перезагрузки

3. LVM создан, расширен и задокументирован

Репозиторий содержит все необходимые скрипты, конфигурационные файлы и подробные отчёты.


### Ссылка на репозиторий

https://github.com/Scif454?tab=repositories



