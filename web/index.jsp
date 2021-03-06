<%-- 
    Document   : index
    Created on : 28 de fev de 2021, 18:19:43
    Author     : Gustavo Moraes
--%>

<%@page import="br.senac.sp.bd.ConexaoDB"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="JS/navBar.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="CSS/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="CSS/navBar.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/Index.css" />
        <link rel="stylesheet" type="text/css" href="CSS/Produtos.css" />

        <title>DEV Space</title>
    </head>
    <body>
        <%
            Statement st = null;
            ResultSet rs = null;
        %>
        <div id="flipkart-navbar">
            <div class="container">
                <div class="row row2" id="nav">
                    <div class="col-sm-2">
                        <h2 style="margin:0px;" ><span class="smallnav menu">☰</span></h2>
                        <h1 style="margin:0px;"><span class="largenav"></span></h1>
                        <div id="logo" style="padding-left: 70Px" >
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="147" height="68.399" viewBox="0 0 147 68.399">
                            <defs>
                            <pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 168 313">
                                <image width="168" height="313" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKgAAAE5CAYAAAAEBmvmAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAADiYAAA4mAaLvJfwAAAa9aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwMiA3OS4xNjQ0NjAsIDIwMjAvMDUvMTItMTY6MDQ6MTcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9IkFkb2JlIFJHQiAoMTk5OCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YTBlNjEzMDctYjMyYi01NzQ1LTlhN2MtYWYzMDkxYzUxNDhkIiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MmE3MTBjNTktNzk0ZC05YjRhLWJkOTAtN2VhYmNlMDc2NjEwIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YTI2M2QyYTQtNmIzZC1iYjQ5LTgwYjEtZjgwMjFkYjgwODk2Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphMjYzZDJhNC02YjNkLWJiNDktODBiMS1mODAyMWRiODA4OTYiIHN0RXZ0OndoZW49IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjZkMjQ4ZGMtMTMxYi1lMTRiLWExNmUtMTRmOWY5NDdhZGU2IiBzdEV2dDp3aGVuPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOmEwZTYxMzA3LWIzMmItNTc0NS05YTdjLWFmMzA5MWM1MTQ4ZCIgc3RFdnQ6d2hlbj0iMjAyMC0xMS0wOVQyMDo1NjozOS0wMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5PiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjhuoLoAAA99SURBVHic7d15sCZVecfx7zkHUFBABYxAoogQAkjcFwQVSYyJCwqKRK2ISsABNOISxhhAVh0hgOy7looJgizGmCqrkkoiipEymwSEGVFrRGDYwyIKdJ/8cbrn3tnu3Pe93X2e7v59/va+71PU13vnefu83S7GiIhVPvcAInNRoGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BimkKVExToGKaAhXTFKiYpkDFNAUqpilQMU2BSme8Cy/1Lnx8op9paxiRmnfhed6Fy4DrgVdP8rMbtDOSCHgXtgKOBhYBG07zGgpUGuddeArwMeAvgU0X8loKVBrjXdgAOAg4FnhWE6+pQKUR3oX9gM8AOzX5ugpUFsS7sCdwMrB7G6+vQGUq3oVdgM8C+7T5PgpUJuJd2BY4DngfENp+PwUq8+Jd2BxYDBwBbNzV+ypQmZN3YSPgcOCvgS26fn8FKmvlXXDAu4ETge1yzaFAZQ3ehT8CPge8MPMoClRmeBdeTArzD3PPUlOggnfhuaQ/5e8CXOZxVqFAR8y7sCVwFHAosFHmcdZKgY6Qd2ET0sdFi4HN8k4zNwU6It6FAHyAdJhjm7zTzI8CHQnvwltJlyZ3zj3LJBTowHkXXkU6zLFH7lmmoUAHyrvwe6TfmG/LPMqCKNCB8S5sTfo35kF0cJijbQp0ILwLmwFHAh8FNsk8TmMUaM9VhzkWkb6ctmXmcRqnQHuqOszxp6QrQNtnHqc1CrSHvAt/QNrMX5x7lrYp0B7xLrwQWAK8IfMonVGgPeBdeA7pT/l7MHaYo20K1DDvwjNIJ9kPB56UeZwsFKhB3oWNgY8AnwQ2zzxOVgrUkOowx4HA8cC2mccxQYEa4V14C+nS5K65Z7FEgWbmXXgl6SOjiW5LOBYKNBPvwu+S7mX09tyzWKZAO+ZdeBbwaeDP0X//9dJ/oI54FzYFPgF8HHhK5nF6Q4G2zLuwIfBB0mGOZ2Yep3cUaEuqwxz7AycBO2Qep7cUaAu8C68j3QDhZbln6TsF2iDvwm6kMP8k9yxDoUAb4F14Nunqz5+hR/s0SoEugHfh6cCngA8BT848ziAp0Cl4F54MfBj4K+DpmccZNAU6Ae+CB95L+nP+O5nHGQUFOk/ehTeSTrPvlnuWMVGg6+FdeDlpM98r8yijpEDXwbuwA+kwx/65ZxkzBboa78IzgWOAQ5jyAajSHAVa8S48lXSQ4xPAUzOPI5XRB1o9APVg0hG438o8jqxm1IF6F95B+nfmjrlnkbUbZaDehdeQvmbxityzyNxGFah3YVfSZ5lvzj2LzM8oAvUu/Dbp6s+B6DBHrww6UO/C00g3P/gIOszRS4MM1LvwJNIJo08Bz8g8jqzqrkn+x4MKtDrM8R7gBOA5mceRVV0HnFTG4h8n+aHBBOpd+GPSAvSC3LPIKv6JFOa/TvPDvQ/Uu/AS0kdGe+eeRVaKwDdJYV6/kBfqbaDehe1J35g8gJHdM9OwArgC+EwZixuaeMHeBepd2Ir0HfNF6DCHFY8DXwGWlLFY1uQL9ybQ6gGoHyM9amXTzONI8ihwCXByGYtftPEG5gOtDnMcRDrMsXXmcSR5CDgPOK2MxYo238h0oN6FfUn3zNwp9ywCwH3AmcCZZSzu7+INTQbqXdiTtJnvnnsWAeBO4DTgvDIWD3f5xqYC9S7sTPosc5/cswgAy0m/KC4pY/HrHAOYCNS7sA1wHPB+BvAA1AFYSvpFcWkZi8dzDpI1UO/C5sBi4Ahg45yzCAA/Ih3gvqKMRZl7GMgUaPUA1MOAo4Atcswgq/gB6aLHP5SxiLmHma3TQKt7Zr6b9NS07bp8b1mrfyFdjvzn3IOsS2eBehdeT7oBwou6ek9Zp2+Rwvx+7kHWp/VAvQsvIoX5+rbfS+ZUAleSrpP/d+ZZ5q21QL0LzyX9KX8XOsyR0xPAV4HPlrG4Jfcwk2o8UO/CFqTl5zBgo6ZfX+btN8AXSNfJf555lqk1Fmh1mOMI0mGOUT8ANbNHgPOBU8tY3JF7mIVacKDVA1DfT/qgfZsFTyTTegA4CzijjMW9mWdpzIIC9S7sQ7risHMz48gU7gJOB84tY/Fg7mGaNlWg3oXdSddo92x2HJnAbcApwEVlLB7NPUxbJgrUu7AT6fjbvu2MI/NwK+mv1pfLWDyWe5i2zStQ78LWwLHAB+b7M9K4G0nXyb9WxqLIPUxX5oytegDqkaSvWmzSyUSyuh+SrpN/w9p18i6sNdDqAaiHkj7P3KrTiaR2Lely5LdzD5LTKoFWhzkOIP0/dvssE8m3SWFem3sQC1YG6l3Ym7SZvyTfOKMVgWtIYf5H5llMcQ7/AtJhjjfkHmaECuAy0gGOm3IPY5Fz+ALdM7NrjwFfIt3o4Ke5h7FsAxRnl34FXAScUsbil7mH6QN9ptmNB4FzgNPLWNyde5g+UaDtugc4Azi7jMUDmWfpJQXajtuBU4ELylg8knuYPlOgzfoZ6aO6L5ax+E3uYYZAgTbjZtIhmr8tY/FE7mGGRIEuzH+RDnBcZeVGB0OjQKcz1QMBZHIKdDILeiCATE6Brl9jDwSQySnQdSuBy2nwgQAyOQW6ptYeCCCTU6Azfg1cTLpOvjz3MJIo0A4fCCCTG3OgnT8QQCY3xkBXkK6Td/5AAJncmALN/kAAmdwYAl1Guk6e/YEAMrkhB2rugQAyuSEGavaBADK5IQVq/oEAMrkhBPot0uXI63IPIs3r+zc6l5Ou/ph/WoVMp++BPhu4GvhP78K+1a17ZECcww9pkfgf4Hjgai1IwzC0QGs/IoV6lULtt6EGWruB9HAHhdpTQw+0dgPpN+qVCrVfxhJo7X9JoX5dofbD2AKt3chMqLoMathYA63dCJyArtebNfZAazeRQr1codqiQFf1Y1KoX1OoNijQtbuZFOplCjUvBTo3hZqZAp2fW5gJdTRPebNAgU5mKSnUv1Oo3VCg01kKnEi6H6hCbZECXZhlpFC/qlDboUCb8RNSqJcq1GYp0Gb9hPSFvUt1K/BmKNB23EoK9SsKdWEUaLt+Sgr1ywp1Ogq0Gwp1Sgq0Wz9jJlTdhmceFGgePyeF+iWFOjcP6FEq3duO9NTjpd6Fg70LG2aexyxfxuJNwN7AD3MPM0LbARcCy7wLhyjUNbkY01/46qYHB5D+9Gyfc6gRW066I98Xy1g8lnsYC1YGWvMubAQcChwNbJFjKGE56Z6mXxh7qGsEWvMubA4sBo4ANu5wJpnxC1Kol4w11HUGWvMubEs6YnYg/b+XU1+NNtT1BlrzLjwf+BzwxlYnkrncxkyoo3ge/bwDrXkX9gJOAV7axkAyL7cBS4CLhx7qxIGCNn5DfkkK9aKhhjpVoLVZG/9RwJZNDSUTu52ZUAf1iJ0FBVrzLmwGfBJt/LndTtoTLhxKqI0EWqs2/uOB96GNP6c7SKFe0PdQGw20Vm38S4A3Nf7iMok7SE/Xu6CMxaO5h5lGK4HWqo3/ZOBlrb2JzMedzPxG7VWorQYKKzf+d5KuMWvjz+tO0i+M8/sSauuB1qqNfxHpGr82/rxWMBPqr3IPM5fOAq1VG/9i4KNo489tBemiy3lWQ+080Nqsjf9AIGQZQmp3kUI911qo2QKteRd2Jf0DXht/fnczE+ojuYcBA4HWvAuvJf3H0caf393A3wDn5A7VTKCwysZ/EvC8zOMI3MNMqA/nGMBUoLXquzn1qX5t/PndA5wKnN11qCYDrWnjN+de0m/UzkI1HWjNu7ANM9f4tfHndy8zv1EfavONehFordr4lwBvzj2LAHAfKdSz2gq1V4HWqo3/ZODluWcRIIV6GnBm06H2MlBYufHvT7rGr43fhvuA00mhPtjEC/Y20Fq18S8CjkEbvxX3k0I9Y6Gh9j7QWrXxH0na+DfJPI4k9wOfJ4X6f9O8wGACrWnjN+kBUqifnzTUwQVa8y7sQrrGr43fjgeAI8tYXDTfHxjs94bKWNxUxuItwF7A9ZnHkeRpTHgoaLCB1spY/FsZi1eQvsd/a+55ZDKDD7RWxuJyYGfgL0indaQHRhMoQBmLx8tYnAXsQDoxZepwrqxpVIHWylg8WMbiKGBH4GJAT4czapSB1spY3F7G4mDg94Fv5p5H1jTqQGvVxr8P8Fq08ZuiQGcpY/GdauN/J+m5m5KZAl2LMhZXALsAH0Ybf1YKdB2qjf9s0kmpE9HGn4UCXY8yFg+VsTgabfxZKNB50safhwKd0Gob/w9yzzN0CnRK1cb/StKpfm38LVGgC1TG4uto42+NAm2ANv72KNAGzdr4dyA9blsb/wIp0BaUsbijjMUhwG7A3+eep88UaIvKWPy4jMVbgdegjX8qCrQDZSyunbXxL8s9T58o0A5VG/+uwIdIdzWW9VCgHas2/nNIi9QJaOOfkwLNpNr4j0Eb/5wUaGba+OemQI1YbeP/99zzWKFAjak2/t2Bd6CNX4FaVcbiStI1/lFv/ArUsDIWT6y28Zt4dlGXFGgPzNr4dwQuZEQbvwLtkWrj/yDwfOAbuefpggLtoTIWN5exeBvwaga+8SvQHitj8d2hb/wKdABmbfyHM7CNX4EORLXxn0s61X88A9n4FejAlLF4uIzFp0kfTV1Azzd+BTpQZSzuLGOxiJ5v/Ap04Fbb+L+feZyJKdCRqDb+VwFvB5bmnme+FOjIlLG4inSqvxcbvwIdoT5t/Ap0xNay8T+ReaQ1KFCZvfHvBlyTeZxVKFBZqdr49wX2xMjGr0BlDWUsvmdl41egsk6zNv7DgBU5ZlCgMqdq4z+PtEgdR8cbvwKVeak2/mNJoZ5PRxu/ApWJVBv/oaRr/Ne0/X4KVKZSxuKWWRv/dW29jwKVBak2/j2A/Whh41eg0ogyFlfTwsavQKUxa9n4H17oaypQaVyTG78CldaUsVgxa+O/eprXUKDSumrj3w/Ygwnv1e9ijO1MJdIA/QYV0xSomKZAxTQFKqYpUDFNgYppClRMU6BimgIV0xSomKZAxTQFKqYpUDFNgYppClRMU6BimgIV0xSomKZAxTQFKqYpUDFNgYppClRMU6BimgIV0xSomKZAxTQFKqYpUDFNgYppClRMU6BimgIV0xSomKZAxTQFKqYpUDFNgYpp/w9/Fw20s4bWRAAAAABJRU5ErkJggg=="/>
                            </pattern>
                            <pattern id="pattern-2" width="1" height="1" patternTransform="matrix(-1, 0, 0, 1, 38, 0)" viewBox="0 0 19 35.399">
                                <image preserveAspectRatio="none" width="19" height="35.399" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKgAAAE5CAYAAAAEBmvmAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAADiYAAA4mAaLvJfwAAAa9aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwMiA3OS4xNjQ0NjAsIDIwMjAvMDUvMTItMTY6MDQ6MTcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9IkFkb2JlIFJHQiAoMTk5OCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YTBlNjEzMDctYjMyYi01NzQ1LTlhN2MtYWYzMDkxYzUxNDhkIiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MmE3MTBjNTktNzk0ZC05YjRhLWJkOTAtN2VhYmNlMDc2NjEwIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YTI2M2QyYTQtNmIzZC1iYjQ5LTgwYjEtZjgwMjFkYjgwODk2Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphMjYzZDJhNC02YjNkLWJiNDktODBiMS1mODAyMWRiODA4OTYiIHN0RXZ0OndoZW49IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjZkMjQ4ZGMtMTMxYi1lMTRiLWExNmUtMTRmOWY5NDdhZGU2IiBzdEV2dDp3aGVuPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0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"/>
                            </pattern>
                            </defs>
                            <g id="Grupo_9" data-name="Grupo 9" transform="translate(-110 -36)">
                            <text id="DEV_space" data-name="DEV
                                  space" transform="translate(132 40)" fill="#fff" font-size="25" font-family="ArialMT, Arial"><tspan x="0" y="23">DEV</tspan><tspan fill="#504f4f"><tspan x="0" y="52" xml:space="preserve">     </tspan><tspan y="52" fill="#005038" font-family="Arial-ItalicMT, Arial" font-style="italic">space</tspan></tspan></text>
                            <rect id="codificacao-html2" width="19" height="35" transform="translate(110 36)" fill="url(#pattern)"/>
                            <rect id="codificacao-html2-2" data-name="codificacao-html2" width="19" height="35.399" transform="translate(238 69)" fill="url(#pattern-2)"/>
                            </g>
                            </svg>
                        </div>
                    </div>
                    <div class="flipkart-navbar-search smallsearch col-sm-8 col-xs-11" style="padding-top: 11px; width: 600px; padding-left: 100px" >
                        <div class="row">
                            <input class="flipkart-navbar-input col-xs-11" type="" placeholder="Busque por Curso" name="">
                            <button class="flipkart-navbar-button col-xs-1">
                                <svg width="15px" height="15px">
                                <path d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="col-sm-1" style="padding-top: 14px; padding-left: 50px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                    </div>
                    <div class="cart largenav col-sm-1" style="padding-top: 11px; padding-left: 50px; ">
                        <a class="cart-button" >
                            <svg class="cart-svg " width="16 " height="16 " viewBox="0 0 16 16 ">
                            <path d="M15.32 2.405H4.887C3 2.405 2.46.805 2.46.805L2.257.21C2.208.085 2.083 0 1.946 0H.336C.1 0-.064.24.024.46l.644 1.945L3.11 9.767c.047.137.175.23.32.23h8.418l-.493 1.958H3.768l.002.003c-.017 0-.033-.003-.05-.003-1.06 0-1.92.86-1.92 1.92s.86 1.92 1.92 1.92c.99 0 1.805-.75 1.91-1.712l5.55.076c.12.922.91 1.636 1.867 1.636 1.04 0 1.885-.844 1.885-1.885 0-.866-.584-1.593-1.38-1.814l2.423-8.832c.12-.433-.206-.86-.655-.86 " fill="#000"></path>
                            </svg> Carrinho  
                            <span class="item-number ">0</span>
                        </a>
                    </div>
                </div>
            </div>
        </div> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">☰ Todos os Cursos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="Listar%20Cursos.jsp">Cursos</a>
                        <a class="nav-link" href="#">Java</a>
                        <a class="nav-link" href="#">HTML</a>        
                    </div>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center; margin-left: 25px; margin-right:  30px">

            <div id="carouselExampleCaptions" class="carousel slide col-md-10" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner " align="center" >
                    <div  class="carousel-item active" >
                        <img src="Imagens/1-1.jpg"alt="banner" style="">
                    </div>
                    <div class="carousel-item text-center">
                        <img src="Imagens/2-2.jpg" alt="banner">
                    </div>
                    <div class="carousel-item text-center">
                        <img src="Imagens/3-3.jpg" alt="banner">
                    </div>
                </div>
                <br>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="prev" >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>

                </button>
            </div>
        </div>

        <div class="container-fluid col-md-4" style=" margin-left: 130px;"> 
            <h3 style="font-size: 20px; color: #000; font-style: italic">Cursos mais Populares</h3>     
        </div>
        <div class="col-sm-10" style="margin-left: 110px; margin-bottom: 60px">	
            <div class="col-sm-1" id="iconePop" style="margin: 5px 30px;">
                <img src="Imagens/HTML5_icon-icons.com_67090.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop" >
                <img src="Imagens/CSS3_icon-icons.com_67069.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop">
                <img src="Imagens/icons8-javascript-96.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop" >
                <img src="Imagens/java_original_logo_icon_146458.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop" >
                <img src="Imagens/c_original_logo_icon_146611.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop">
                <img src="Imagens/csharp_original_logo_icon_146578.png" width="100" height="100">
            </div>
            <div class="col-sm-1" id="iconePop" >
                <img src="Imagens/python_original_logo_icon_146381.png" width="100" height="100">
            </div>  
        </div>

        <div class="container">
            <div class="row">
                <aside class="col-md-3">
                    <div class="card">
                        <article class="filter-group">
                            <header class="card-header">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h5>Categorias de Cursos</h5>
                            </header>
                            <div >
                                <div class="card-body">                                
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Desenvolvimento Web
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Linguagens de programação
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Desenvolvimento móvel
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Desenvolvimento de games
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Desenvolvimento de bancos de dados
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Teste de software
                                        </label>
                                    </div>
                                </div> 
                            </div>
                        </article> 
                        <article class="filter-group" >
                            <header class="card-header">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h5>Linguagens de Programação</h5>
                            </header>
                            <div >
                                <div class="card-body">                                
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Python
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            JavaScript
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Java
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Unity
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            PHP
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            C#
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            CSS
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            HTML
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Swift
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Angular
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Node.Js
                                        </label>
                                    </div>
                                </div> 
                            </div>
                        </article> 
                        <article class="filter-group" >
                            <header class="card-header">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h5>Classificação</h5>
                            </header>
                            <div >
                                <div class="card-body">                                
                                    <div class="form-check">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            (5) 
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>                                      
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            (4) 
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault"> 
                                        </label>
                                        <label class="form-check-label" for="flexCheckDefault">
                                            (3) 
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            (2) 
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#ffc700" class="bi bi-star-fill" viewBox="0 0 16 16">
                                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                        </svg>
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            (1) 
                                        </label>
                                    </div>
                                </div> 
                            </div>
                        </article> 
                        <article class="filter-group" >
                            <header class="card-header">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h5>Idioma do Curso</h5>
                            </header>
                            <div >
                                <div class="card-body">                                
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Português
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            English
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Español
                                        </label>
                                    </div>
                                </div> 
                            </div>
                        </article> 
                        <article class="filter-group" >
                            <header class="card-header">
                                <i class="icon-control fa fa-chevron-down"></i>
                                <h5>Preço</h5>
                            </header>
                            <div >
                                <div class="card-body">                                
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            R$ 50,00 a R$ 100,00
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            R$ 100,00 a R$ 200,00
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            R$ 200,00 a R$ 300,00
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            R$ 300,00 a R$ 400,00
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Acima de R$ 500,00
                                        </label>
                                    </div>
                                </div> 
                            </div>
                        </article> 
                    </div> 

                </aside>
                <main class="col-md-9">
                    <header class="border-bottom mb-4 pb-3">
                        <div class="form-inline">
                            <span class="mr-md-auto">32 Cursos Encontrados </span>
                            <select class="mr-2 form-control" style="margin-left: 540px">
                                <option>Mais Vendidos</option>
                                <option>Melhor Avaliados</option>
                                <option>Menor Preço</option>
                                <option>Maior Preço</option>
                            </select>
                        </div>
                    </header>
                    <%
                        String Enome = "";
                        String Epreco = "";
                        String imagem = "";
                        try {
                            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                            rs = st.executeQuery("SELECT * FROM curso, imagens where codCurso = curso_codCurso and imagens.principal = 1 and estado = 'Ativo'");

                            while (rs.next()) {%>
                    <div class="display-flex">
                        <div class="col-md-4" style="margin-bottom: 10px; text-align: center">
                            <figure class="card card-product-grid">
                                <div class="img-wrap" style="width: 240px; height: 240px"> 
                                    <img src="Imagens/<%= rs.getString(10)%>" class="img-fluid">
                                </div> 
                                <figcaption class="info-wrap">
                                    <div class="">
                                        <a style="font-size: 18px"><%=rs.getString(2)%></a>
                                        <div style="font-size: 18px">
                                            <span>R$ <%=rs.getString(7)%></span>
                                        </div> 
                                    </div>
                                    <a href="Visualizar Curso.jsp?id=<%= rs.getString(1)%>" id="btnProd" class="btn btn-block btn-success" style="background-color: #00A172; border-color: #00A172">Visualizar </a>
                                    <a href="#" class="btn btn-block btn-success" id="btnProd" style="background-color: #198754; border-color: #198754">Adicionar ao Carrinho </a>
                                </figcaption>
                            </figure>
                        </div> 
                    </div>
                    <%}
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %> 
                    <div id="bntFinal" class="container-fluid" style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
                        <button type="button" class="btn btn-light" style="background-color: #ddd; border-color: #ddd;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"></path>
                            </svg>
                        </button>
                        <button type="button" class="btn btn-light" style="background-color: #ddd; border-color: #ddd; margin: 1%">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
                            <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"></path>
                            </svg>
                            Anterior
                        </button>
                        <button type="button" class="btn btn-light" style="background-color: #ddd; border-color: #ddd; margin: 1%">
                            Próximo
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
                            <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"></path>
                            </svg>     
                        </button>
                        <button type="button" class="btn btn-light" style="background-color: #ddd; border-color: #ddd; margin: 1%">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"></path>
                            </svg>
                        </button>
                    </div>
                </main>

            </div>
        </div>
    </body>
</html>
