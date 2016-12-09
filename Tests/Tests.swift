import XCTest

class Tests: XCTestCase {
    func testMath() {
        var d = Math.degreesToRadians(45)
        var almostRight = d <= 0.786 && d >= 0.785
        XCTAssert(almostRight)

        d = Math.degreesToRadians(65)
        almostRight = d <= 1.135 && d >= 1.134
        XCTAssert(almostRight)

        d = Math.radiansToDegrees(M_PI)
        almostRight = d <= 180.1 && d >= 179.99
        XCTAssert(almostRight)

        d = Math.radiansToDegrees(M_PI / 2)
        almostRight = d <= 90.1 && d >= 89.99
        XCTAssert(almostRight)
    }

    func testSerializer() {
        var dictionary: [String: Any] = ["": ""]
        var string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"\":\"\"}")

        dictionary = ["key": "value"]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"key\":\"value\"}")

        dictionary = ["array": ["element1", "element2"]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"array\":[\"element1\",\"element2\"]}")

        dictionary = ["array": ["element2", "element1"]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"array\":[\"element2\",\"element1\"]}")

        dictionary = ["array": ["string", 123]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"array\":[\"string\",123]}")

        dictionary = ["dict": ["key1": "value1", "key2": "value2"]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"dict\":{\"key1\":\"value1\",\"key2\":\"value2\"}}")

        dictionary = ["numbers": ["int": Int(12), "float": 2.2]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"numbers\":{\"float\":2.2,\"int\":12}}")

        dictionary = ["dictception": ["dict": ["key": "value"]]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"dictception\":{\"dict\":{\"key\":\"value\"}}}")

        // Test ordering
        dictionary = ["b": [["c1": "d1"], ["c2": "c2"]], "a": ["d1": "d1", "a": "value"]]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"a\":{\"a\":\"value\",\"d1\":\"d1\"},\"b\":[{\"c1\":\"d1\"},{\"c2\":\"c2\"}]}")

        dictionary = ["signedPreKey": ["keyId": 0, "publicKey": "CAASIQUIia6Pupgs1zcJ2zXN5LtjfrSqIS6yLV+L3wbRiIMgQxoggIRe0ayB3o7GWQl6KpRkjOhNDJj/EIVdFx18oYP58GoiQPn8FOPGcGIeVUIGaCV56F7v3CWGW80twgGTWboqMb7sFjzYj3rcMNv8+3QjsVgvVWcBGMkEZt7w8dmC3qcKEIQpZSni4lgBAAA=", "signature": "+fwU48ZwYh5VQgZoJXnoXu/cJYZbzS3CAZNZuioxvuwWPNiPetww2/z7dCOxWC9VZwEYyQRm3vDx2YLepwoQhA=="], "password": "device-specific-password", "signalingKey": "bb44dbb0c6a67ba66667e8a2d6810c7f3723436bd4377fa02470cce4c06ee8f04d40e958c16a01f969215ec34d4fae13169d29d9", "lastResortKey": ["keyId": 16777215, "publicKey": "CP///wcSIQVb9c4iyPT0WyrYOT1ru7pzUeDNOq162pcrzre1NfnzORogyCRCzn5gSlz7aUTVdNM70yA5bxNexOuXvxYwEjdY/00="], "registrationId": 1715422480, "preKeys": [["keyId": 512, "publicKey": "CIAEEiEFG7bufmVYPqdL2XcZPRYokzbS+uoWYE37Ab7roTwc1F8aIFCb4Htdp0YFIybCZNJuZENUyYNqwPWsJG5PmxoQ0Kp4"], ["keyId": 1, "publicKey": "CAESIQXuelxf2bd6CHcUJW87JL/Gvk/P8ifS/LzIKx4xIknFNhogmAQ3O0e+Fx4VL4JQSp0TcI4H/PHsm2ds9VuIi8JarFE="], ["keyId": 2, "publicKey": "CAISIQXUf1vp4dFR5m5+Ade6EfeRHTIw6192l6QHmmrZnEAaMRog0MoyCytYxKoCSmPmJ7EyrO9IEmTpd2TZgOyY5/9CHVA="], ["keyId": 3, "publicKey": "CAMSIQWNQFBKIPGs7E/6myl+hOHnsHTzsBtsmNJGieHZ+TSNChogICmP+LhYGeBxK/nD69Fzh0OzzSrSNXx8cwrIDDv6x00="], ["keyId": 4, "publicKey": "CAQSIQU1ukhOscFDy4U1NfzVg8FSxUbqhamGZD72nJmSFO1wQxogmOOLSt4nzorHDf/6F7YyC+BXLz9q17jKG6DUy9t7in4="], ["keyId": 5, "publicKey": "CAUSIQXdmY9uErehJKXqcEOz8ID4uwr62WnYUrIzDSOUZFOwOxogYBro5UNEstirj5AuSPCe2UvmTWhvNhE6UmgcjuiQ7HM="], ["keyId": 6, "publicKey": "CAYSIQU+QRmOx/8u7pbPNOfH/TDhPAQeZwlyPuwUGZ+0E4KUPBog4AeQr4bO/oYI5JEKpQngly8KU0T/ixhYWj3J374/AEI="], ["keyId": 7, "publicKey": "CAcSIQWmn7xQiV3Gkr1Ja1u+9QAJTNGpw/kyk4vekF9/ZXEGHRogMHJJcsVE2A47ikX4YKwCwfZXNlxZirjhrsABhU8nDFU="], ["keyId": 8, "publicKey": "CAgSIQWU+CH1usb9VC+l9HKB2j3mCMtLcqHz1lDvRR/15bR5dhogSLMJCArJNPjc0RGE7dxW4U/5pPgQXfkf29MXWKgPHFc="], ["keyId": 9, "publicKey": "CAkSIQVm9xTISMKG+FU9r+8hdX0CmP1GlqGvIOpP8H0Kc/VzaBogSHtsUeVv6OCvCnsDZTNpjfKTSvgMsBwNzpnKpzVZyGE="], ["keyId": 10, "publicKey": "CAoSIQXBemWkieczXAKYZa/W1Z/Sd9K9MH5Udwzl4qQ8Vn5LfhogwHU8ZM0rJ2LYJKgzoaPv/6HPBq2cKYB7i/ngc43gaF4="], ["keyId": 11, "publicKey": "CAsSIQWqvB3YDVWrc9Q+r5qeqrQWpOhoEHhLyt6omVLDjkbhdBog2CjkcIa8EiETKhFC57FUJyfcYogYW7K85JzvH3BWtGc="], ["keyId": 12, "publicKey": "CAwSIQXdzXK0Q9KCvZMWDT6w5v/bQtfEREZFQYIMGELbBKM5BRogmGGEsxIeaSYS8T97H4bliyt0ToqU4gunxrowH8hsFHM="], ["keyId": 13, "publicKey": "CA0SIQWh6jxWRUHEDWWrRKaGNTzIzNFuQF9wYjATGtOe/6q3Gxog6Hi33jMT1IuetqaBVS98u3NSg9tfwHRPPFIlSSFnN24="], ["keyId": 14, "publicKey": "CA4SIQUvhsjairXESuTAnSDo/82quu+aroOhdeqjmQoUddLQNhogAGTgT3b8kBz/JhQ02SWrqf234SnqadR0WKBL8MK3xVE="], ["keyId": 15, "publicKey": "CA8SIQVaqG/q5pYq3CvZzu4n8tc91JlkGHH0rFr7A7kwWBrTNhog+DBo+dhvn32GwEQ3H25yA6lFgF09PZXQwUsm6zHWl04="], ["keyId": 16, "publicKey": "CBASIQWzTMIm4JlE/qERsXhhFRey0qAnyoP5R+2tvgQe5X9kIxog6G4zKG1SVJVe6i9QDKKy7LCcTUgmvuboXS3p1Aip+2Y="], ["keyId": 17, "publicKey": "CBESIQVlCOGpCxqf8eELL78+tU19muOmFaHPK/NTQMAdSil3SxogwC5gUMGFqp7cvHg2kLWsgPjHAY0GpZns/yb9gAdq60M="], ["keyId": 18, "publicKey": "CBISIQVabvwjTcRl6EErlmOXWS/EKmtGDqsYSKohddckKH+Scxog0OgPeUsG/Ok7qLFErr/1/uoCRooxBTanlwjTLsR+tmE="], ["keyId": 19, "publicKey": "CBMSIQXZubY+Bv4wPCdSv4agMhQ/F5F3u9CKzUsLtYmBoOYPMBogGBdhlaeD/oXC8iP2/Wx2nWngPAgin0xxPfE1SeIklXM="], ["keyId": 20, "publicKey": "CBQSIQXhxibueJ2XPtp7J8DVeWQtwQ1JnwpuGLv9wZ3ieA69Sxog6KOC0iPFqEH2jC11E/dOSpFYmPxqYZxeKcbOrR6GwnI="], ["keyId": 21, "publicKey": "CBUSIQV8acmXIpz8K4USbqERU1QjkuzAseNujHl1ijjxvTBccBogQFLAEiLJwtgmD8sDe9Z6jk5qSIbtc51fI/MWsjQ3Els="], ["keyId": 22, "publicKey": "CBYSIQUGQGU2A0DiVHURPi59nhn4dfHiQQ+/MXMWgtWrNphICBogkAMibeLtqUPKlnPbKCcDJ2F+bmosi+8gfxv5SKvA92s="], ["keyId": 23, "publicKey": "CBcSIQX4+jhDOSFCOo1LxMwPKpz2Vz5hEjZqA6pQ/Q2yoNvSNRogmNkRGIuHc/yWQG2346BP3Q5UIatxwr0ntOnu4AAigHY="], ["keyId": 24, "publicKey": "CBgSIQWMxza+rCWNC9II8w1XIZe/37iKkF0XAUfuqE8TiOTBDBogKAEE+3lcoKtes/JfR1t6L7Z23i4VgnoNdzxfst2aP3o="], ["keyId": 25, "publicKey": "CBkSIQWq3rnXUcuJwoCKi99++PHcGcycg7dTopqNfOb8UtruchoguOSmNoCM8jQkA8WvAUd0CckphEe6MF/UwGoNgWsD3l0="], ["keyId": 26, "publicKey": "CBoSIQWm4Lm0kayxg8DJsL0NxAS2c3FTE86e05vvW9wPfWk0Xhog6GQ908Q22/6R5pyXLrCxtmfK/6XvHtiuJx7ElDdlC00="], ["keyId": 27, "publicKey": "CBsSIQVxhc1a7jgrLAxnoeAJe5/pSphaids8AADBBus5jT62YBog2NKTZE8BHXGUHPleRy8T4Q1dV+Mk1keXYdQzN+eWCFU="], ["keyId": 28, "publicKey": "CBwSIQUJDoK3vGoodxYxLL49aSrEjhtgDIn8F4Y1ABHGMIVPQRogSFbshZnsjBfKhZhTLJxzqOnxTmFxp3N6eabnvWZyHlg="], ["keyId": 29, "publicKey": "CB0SIQWTMz1kp2McHCvIG3GH4iKmcgs375fGyuF2saz+blcbLxogWAgk+xiVMJhsxIZBEUeO5+efCpxmWUcARnL4KkXDuV4="], ["keyId": 30, "publicKey": "CB4SIQXjmMvCgHbZwK0kbaRBE3tQcf8yi/5O6NwskB2t1mFcXRogGPtuixOehX83VXYKYRKlab4f3v4kyzHREc0wh0kqLWY="], ["keyId": 31, "publicKey": "CB8SIQV/QzdrAPvWB3hPZKhKRsjFMa2U8L5LFCWn5/ObynmJEhogONjelPBPxLTObYZGh/mv2sxytmOzEr8aCy9X0hzI80M="], ["keyId": 32, "publicKey": "CCASIQVkBQQSwyP/0RfwEaa9FRpHVTbZl6Srxckt5YOyNqYnBBoggDeCWO70ulekPSvwLPp2CUOH6f76+qjIFDdvGHpXrHA="], ["keyId": 33, "publicKey": "CCESIQWUDF1r/IqLmGLcDhMRbt7SF7P5zYQZuOEY9L05TIQnahogoGF6D/coZBmxcoOI9DA7k4292RImzDnE3BkIur1Kpm8="], ["keyId": 34, "publicKey": "CCISIQXdTfMNpbZZGMRuV9m4quhdpJ/e1r/ALTYEeQoJF0RjcBogAFcNl3j+V1BKIvyZImui1JwuwQvF9rSDrnz7YMrmW2M="], ["keyId": 35, "publicKey": "CCMSIQXfuVjOCudtWIadCeAVT5sU2hvfjfKKcTtbZs3TbMtMLhoguBHubFD3OCUK0ohfzgjJa+aVBjk4JEOPOGmpuVKtukM="], ["keyId": 36, "publicKey": "CCQSIQWvf8UQdmLv5f1tLhB50pMth3DN8eB6nQCb6O65kLVYSxogeN+fmEp0xHn6jwpnGPBrCR4cRQ3j3C4qr0/ft9E5zUA="], ["keyId": 37, "publicKey": "CCUSIQXdqrSNlZpOZMX8aPSTa79GS1NKHtmYYk66owBbTnEqMBoggOhZFMemZIXNc83uix1ZmkhvFR+5Lv0SXJbyh4aAtm8="], ["keyId": 38, "publicKey": "CCYSIQX0yPVZXVcxfP3/E7xpvk6N0ehTmJ4wxE43FiYGmN3VQBogqLz//d3srACfxvZiaThM6XI4kx5Ic7xBFy4RAxB4lm0="], ["keyId": 39, "publicKey": "CCcSIQXM7NAqr/9GtoQN6WKY7Q8wNXxeo9llDVc5pWkbuIwXZBogaBaKK7t56du/HSkppw0z0z8nfkg9QqeauLnsRq4DFG4="], ["keyId": 40, "publicKey": "CCgSIQWsMTiW5V+7dXsYtOj+RH2K+/iMqCeDzpgddq6gPMEDIhog2Gb7m4ACbeCUe8vCj60kr7H2o2m+uNj6x9TLNbATPHk="], ["keyId": 41, "publicKey": "CCkSIQXabIRvAoKS317pfW+BUBEdx83OUNL2be37ZLCAlepdZhog8BFCcBH2/KCkYH6slYQJAvY75uncaajGGj6Ooe3ikFE="], ["keyId": 42, "publicKey": "CCoSIQULEmlg0hML+9UmCGCHn5bxlFctW+ubv8hyGWiKTV5SCRogCK0MiODpRd2NxJmaiBBl737eHZvcC9KIbO2HSt2DQkI="], ["keyId": 43, "publicKey": "CCsSIQV6sqkki6oE06Op+hPvJysqCfTCHTnO7EijNlFaMO2nLRog8DN85Bz0e0UO4Ja1h+Nay++qbnlltEkJUdvUAtqzSnk="], ["keyId": 44, "publicKey": "CCwSIQU+7conw1semKjX3bHJMxcupdaQxsnFagP4W78y9CcUNxogmOW/nKAWhD7/jE02dp7pur8KfLgEEyvvOhfnYImwDH0="], ["keyId": 45, "publicKey": "CC0SIQUE6C3Qt+UtZc7ymvk886K6qtvLhpjx7lr//BLwBVF8EBoguIt9U2Vtjr7mMHli045UjjTzjJVt52mLZ4FZ+zqM90g="], ["keyId": 46, "publicKey": "CC4SIQUcVFXDeXoi1Mewv0ArLNioHGK1v5QVbFYeP3K5ledmeRogqKe9OaciA3+r3jwhINb4A8+qkVKq/WE2C6bqNevlvkk="], ["keyId": 47, "publicKey": "CC8SIQXKQ6hS5NtGUZNx08mFTKX+GN2iZlfjIHZFMoKCX1/OAhoguE5bLy9/2WyBatH7bnqldCQjvIhYfG3hy0St95KXIEE="], ["keyId": 48, "publicKey": "CDASIQU2bgN5AMmLosMZix75vCAN9XuNn8uP6GTEQ+3umDfbNBogCEuOAKM4Xi6wXW1jYLjH+6jFJy30OM0hn0lyG+N/Vnk="], ["keyId": 49, "publicKey": "CDESIQW/njV4M0dyJwntOqXUVyPdK4agoYOotH2uoKbmvKZmLRogwARLd1lZVhiEa4yzjT6OpXJ9jNXuLkKofgQ9JjtVxFc="], ["keyId": 50, "publicKey": "CDISIQVeS3xUkOhJwthYryCiegDvyrBN/RVREVVRcVWba/foExogaEyoLoxQLm1Kku92F5Ko4VvbuVoUgPl115Yyb0uGcW4="], ["keyId": 51, "publicKey": "CDMSIQWZNXiPcLnafIYnmLQEKwsdLKWui+XefdMiQc2AzUuNQRogQMS3YZBfq/dcKrReESt0hXQ1n79YclPehQ/E6n9qwHM="], ["keyId": 52, "publicKey": "CDQSIQU2MW2zh/uZdBd2NBL7YEUZSC0xhJc60J2htNsK1jCcFBogKG7OmNG+aJAerBZmPDSKoQmZFK06k8JP66dZ9+9vD1w="], ["keyId": 53, "publicKey": "CDUSIQUJQ7ItnAXhqoB1icbxR8hf3JeZJgIhDAti9tuq6L5lbhogMESIRAMxNGQ+XIrlTCh4o+FiVEgWNPVJythnzUSpfl0="], ["keyId": 54, "publicKey": "CDYSIQWZ/Xxp4sDbUNZa2BfBsEiy+Aqla3IhUxRyPFbo44DyIBog4MgmR/9gMGTkpZ2JSsexJHHXOkIEU2eWWliFrRbjeFE="], ["keyId": 55, "publicKey": "CDcSIQWQDZUq8RKjWrXTX5jusKWPoRYLyDwUCuROmgFc4vlmRRogUDR/aCRn/kSa+Fe1jQaOk+DUP0eucDf1IhxO73v/dEo="], ["keyId": 56, "publicKey": "CDgSIQWllmXj8cM/DfSgaRoYS0IgXsO96DZO244qf4enf89MIxogCIS3ZlYHlMSMlvK1vUK76GC2CxXVQkgIq8HqYqUhPWI="], ["keyId": 57, "publicKey": "CDkSIQWyDUvNXVbKlpY1RWQhNKfkKOmSQoEB2n5+Y/t5D6ETFRog0NBNm8hsWBx3xjqOmDGhtuJovBkLax4131woJ0qakXc="], ["keyId": 58, "publicKey": "CDoSIQXmnTaBLo073CLJgWlkFisvpPtqmjIo739HT4c2aGr0UhogOLpv2Eutb53ITZuPF87gKMPm/Ga6l1Zvz8k94TQiJkI="], ["keyId": 59, "publicKey": "CDsSIQUuSdMmu+8+vPmrMq5CR/x0JUVI0/xxZ5XoFWN3yutpVxogqFaSbKnycDFYiqCGTv1TPwRlDgI3O4LCA/+PzFev41U="], ["keyId": 60, "publicKey": "CDwSIQUDN4EpJnXHTb6SzcGZpukHa4NGsyXpHikHUsdHB6xMYxogUN0YvYbYfosjb+BSBgpxlI7Aqk0VsKhQfQKGDoON/nk="], ["keyId": 61, "publicKey": "CD0SIQWP14O6XvYTDexMEUR2GMohgHANVEZkjyMgAom5YmNKEBog+JoOsm6MqVcHwu21yNaIUhz436sqYfdXmoJm/I2hmXk="], ["keyId": 62, "publicKey": "CD4SIQU6RQ7ahHwxPGXAO7Zv/+SImspMdNjua/Q7b+VgNhVdOhogeLi5xe33YdezqTTiZvtHr9IskPPfkqZwNpGv1XTBbGM="], ["keyId": 63, "publicKey": "CD8SIQXtaJoH4np5BDmMw3t4l8lcmMHwQ245hdkmcFXhE+ZPChogsAjU08ODeCJ0lCLgBYswD5NRRpWmgUT42BrFi8Tepk0="], ["keyId": 64, "publicKey": "CEASIQW6DLb8V9ucupl+pOOts8AkNGp8Z6zXjP2eNRS4U7g5NBogsA3gKNsrBrdxPIu0wolEKwlAkIkfZbmBmtOEiuvj3kc="], ["keyId": 65, "publicKey": "CEESIQW0tQrzFIY+nn7bhbc3WM/cz0Qini6YS5NZpnhT+rKnWRogoLSNc3VeK6fsLbveQ9dhYfy6OmEKEo7Yj7tfbE1dm1Y="], ["keyId": 66, "publicKey": "CEISIQXlrQASyjczZAxH0wdPWCWvFJ/qrIgXAnZZBWab6jlgDRogyFpbvPxNdHEEl+32ZXEXigodDVi3XxHjWhcFJajx4Eo="], ["keyId": 67, "publicKey": "CEMSIQXZD+SAjmuErJv1e/takiPCmt0texxIzdP+MLzgr969ARogSJ1CXx8Hfkkf3+QnU4LOU1UV2tuKrP3xyM3+nan/9X8="], ["keyId": 68, "publicKey": "CEQSIQUcGI1cO6fzx1Tkkks3OynT0fmtkoStMGk77LoPJRmFSxog2A9sA503lrpZJCCW0AdPbJN670HkfYOrS1L6DYUvOlI="], ["keyId": 69, "publicKey": "CEUSIQWgaVmpJE32ShuglJLd2wd8tNNyjS2n9Xmkt0CzDsoMThog4G1gmZDnaFhfj6FErOS3yAxnxq2Vtw3jU6VhOn4xQWo="], ["keyId": 70, "publicKey": "CEYSIQXQ9cLChyvOSxAHgXyGMDo6MbTRzB0HjobXzJb2cyJlNBogyCke/FyVsZXCxi3ZgbfBygKiwYwvq53KEpEK81NdNFU="], ["keyId": 71, "publicKey": "CEcSIQV5o906LnZ31Wm4/o/M57w2gr1ftEuJ2uir3JuwU5apPBogiCawAGTn7PmVNLVE4ejom0O/b3xR8ito2q5gUY4QCVw="], ["keyId": 72, "publicKey": "CEgSIQX1RtWShUlIThru/LwNvkBESD6yWhT+yyAmmjWePOIaVhogoF4CtfjcNJkitlPeKhdJlrkjtY92ZYzKZ/i0H5oKY2c="], ["keyId": 73, "publicKey": "CEkSIQW9uCZDb7Rviea8ZeTm8HEbegzHWojAl/DvEVKlAGOfOhog8Imbuis6KpAiYXu4p4hoqu78GMaflAPvKYI8mVIprXU="], ["keyId": 74, "publicKey": "CEoSIQXgMulFfp3ePusUcq+E5CQQvHdkQ41HueYF6dAGyFoPURogQPyB1WfHaSgjIYQT8IwX2pDKTIxK7Vv5WMmOwW7fqmI="], ["keyId": 75, "publicKey": "CEsSIQWd53ajB2m02fC0AuAn/kz8EKdxGcrruJwWzp2giAV6IxogaJTzBfYAemguXhuJAngqYeO+zCcfUc/UTwL8qVR+xmE="], ["keyId": 76, "publicKey": "CEwSIQUSkMHIMK4EGGMd0g4AqnIOYrqch1vTnm6kEmz1GTeYMhog8JTVfqDcZBBqSVT2PRRPadYkMrJ63JfK7rbfzbjWh3Q="], ["keyId": 77, "publicKey": "CE0SIQW3wHMwGwTg+iLIF9i8elFTe0OxRnpoQ1q7ifUtgtfYRBogsB/dEcqOl40uck/M7A5LqhThspaiNuL0DW6WOxnslHY="], ["keyId": 78, "publicKey": "CE4SIQVLueLJd3+7ai2ZNQh9GmVPmeA5Xr0M6cqqZC4YaD3/dxogyPH3zsgyw3wozdsKdiPAOaSB63U5YF8NoE2edpyAJkY="], ["keyId": 79, "publicKey": "CE8SIQW4sD6sBmF/keIr/iAjfT2mZMy1oGVS6/qmVmllpAf4aBogyNlY7/IdZdUm2YShXlfddmErIYMTcXtJnOAidmOwB3c="], ["keyId": 80, "publicKey": "CFASIQXov142oQl2o/GZ/YPfDX3tMTedjE8TDq7YqTPZ1BnyAxog4Lg7X5gvB3zBK8xol7FoifJ0Z0QCnR2fD7kCsR7QdmU="], ["keyId": 81, "publicKey": "CFESIQVbJqOmHECWIbz5j/y7nX3W9ot1Eb2k4BZUPSoPaYqCFRoggH7dkLfOdqI7rmbN1z1DMvqNvF848pPTFbFzAgLWDE4="], ["keyId": 82, "publicKey": "CFISIQVrdsrYviBpaLVdgiGDBRF6P45un5bETleTk7HoWNWTUBogWNIcI1mYPHxUPdRRcS93SM8PzgOR6jvMo0grakizrHc="], ["keyId": 83, "publicKey": "CFMSIQUNzQRlFVuWnSFBoLtn/EAnvczHLwW7/i1MykKzsPl4RRogSKeGKadYtZMTWsV46XA69N3RB5a73DSLYfrsam5zDH4="], ["keyId": 84, "publicKey": "CFQSIQWNLbB79yPH/42eS3hr7TLsIF8/LvCPqAqg4jJsc42lahogoBsu0tvwYVWEpehp3ULZ+UeBQqZpG77sImG1lYjyb1s="], ["keyId": 85, "publicKey": "CFUSIQXLpSBF2LMLnPRZCNsVxxvD58LGtnIqGJlkjJil6nJYRBog0DQ50I8eHD1NEI8wZyrXOvZP6WNWFUOOZYKUzCvNrVg="], ["keyId": 86, "publicKey": "CFYSIQXOqeGtgbdM7qt96cl3Mtl/IN0UGH3bgvMzCQDqs+F2VhogsBQsN8eArnFP6faZjm/pXSGGEjADStnF+mF7KqZyr10="], ["keyId": 87, "publicKey": "CFcSIQUtfdNxRrwJneCcowfwXUVrimTkwbxdtFrcKqJSrolAJxogSLDh2ERfdD0+6v2o0gKuZiX49AoVaGzEz+qRoQv6gUI="], ["keyId": 88, "publicKey": "CFgSIQX+VMYjJuvLTEJoLO8XCPeVcpdoLDHohHmxnuJXiPWtVhogkCEx4j9SLl9CAKrHMprei/y5AlCsRjk2EvHjW+Cui1M="], ["keyId": 89, "publicKey": "CFkSIQVVsQlT8YSQ85ZDjWmUGqKkX06Ic/2NlUPuy12eswTRVxogwHfkZvvKepcjrcxXAOjn0fnujXJqbOgDiUjqcKhhkVc="], ["keyId": 90, "publicKey": "CFoSIQVimMys7sZKzeV1A2DpWDt0GvJcBhinAcZX2lYNPrftQRogsFMnHaY9vC8AtmnTbAD5fHGUTJ3q2yNvfoH03fBGX30="], ["keyId": 91, "publicKey": "CFsSIQWXe5jBcK5D661Lk5glF6vWNSqSiuXPpt1x83KF7IbmCRogCCkv4rJMGDSLoTFrgQOqOtif7l0gSG20aHFl9UpCN2U="], ["keyId": 92, "publicKey": "CFwSIQXqiU80ugWzlw3f/0YacqL/rPATpqsADslB7ZMabfmvQBogcDjdKFmddFHpj2EeSUYmDxgWsenlN18CxLLCxY3XhEg="], ["keyId": 93, "publicKey": "CF0SIQXuTKPvlXbpALUPD8i8FRZCq7arzhgSgmuRzsbJxpLNIhog6LkS4k8TrfQTNcPP6fnrPjDeOriG7sPssDw+uVmS4F4="], ["keyId": 94, "publicKey": "CF4SIQXefiKkCDKCNAJb8xjg0nAj9pLv3x175iSixJ1c2msdZBog8KFIR9auJ/HACQxxCUF1gze/kwl62G4ijVdwReLq3UU="], ["keyId": 95, "publicKey": "CF8SIQXRaahKOPuJExXT1UxeH9qEjsE8Fjf9d6ywh63lwvEoYhogaNNXcXv9f5oft6WEdCS6bJPvBY6Af7xaPtuDgN1WIV0="], ["keyId": 96, "publicKey": "CGASIQXyhq9Evbb3AKm/PFw4gBWgT7sJBMydGX8Y/IGa/qs5SxogILo0JkZUBYfhDm3WHPlZyjzmqV7FJtEADzstPZpwfFY="], ["keyId": 97, "publicKey": "CGESIQXngHrMhwMW75SQTXGHN93zxxa/UGnA4uw4RZqRrECTLRogSClzro7yUzdmtnbHbfi5nEU7LMaSwPoAoQS3St/HYHU="], ["keyId": 98, "publicKey": "CGISIQUYCwnFcRmlD8ZgagG2eLLEr7pQgGiCGJgQGfPGnXQCHRogELHhiYPjR0XSHcYMdXT0cc6tNDfgJ7AkytCieuO5GmM="], ["keyId": 99, "publicKey": "CGMSIQWFyEKj1h0+J2rHYguRc/vnC+ztk/PMjPjACuS85RfvSxog8KYwjCaUs7gS8AWhDSmBpwnFCwOQshSXQDRtn60NT0w="]], "identityKey": "BRXzhqJxAJd+kwQV1jGBmaHTomzcpj3M+eGoS9Pt1+ke", "timestamp": 1481275222]
        string = OrderedSerializer.string(from: dictionary)

        XCTAssertEqual(string, "{\"identityKey\":\"BRXzhqJxAJd+kwQV1jGBmaHTomzcpj3M+eGoS9Pt1+ke\",\"lastResortKey\":{\"keyId\":16777215,\"publicKey\":\"CP///wcSIQVb9c4iyPT0WyrYOT1ru7pzUeDNOq162pcrzre1NfnzORogyCRCzn5gSlz7aUTVdNM70yA5bxNexOuXvxYwEjdY/00=\"},\"password\":\"device-specific-password\",\"preKeys\":[{\"keyId\":512,\"publicKey\":\"CIAEEiEFG7bufmVYPqdL2XcZPRYokzbS+uoWYE37Ab7roTwc1F8aIFCb4Htdp0YFIybCZNJuZENUyYNqwPWsJG5PmxoQ0Kp4\"},{\"keyId\":1,\"publicKey\":\"CAESIQXuelxf2bd6CHcUJW87JL/Gvk/P8ifS/LzIKx4xIknFNhogmAQ3O0e+Fx4VL4JQSp0TcI4H/PHsm2ds9VuIi8JarFE=\"},{\"keyId\":2,\"publicKey\":\"CAISIQXUf1vp4dFR5m5+Ade6EfeRHTIw6192l6QHmmrZnEAaMRog0MoyCytYxKoCSmPmJ7EyrO9IEmTpd2TZgOyY5/9CHVA=\"},{\"keyId\":3,\"publicKey\":\"CAMSIQWNQFBKIPGs7E/6myl+hOHnsHTzsBtsmNJGieHZ+TSNChogICmP+LhYGeBxK/nD69Fzh0OzzSrSNXx8cwrIDDv6x00=\"},{\"keyId\":4,\"publicKey\":\"CAQSIQU1ukhOscFDy4U1NfzVg8FSxUbqhamGZD72nJmSFO1wQxogmOOLSt4nzorHDf/6F7YyC+BXLz9q17jKG6DUy9t7in4=\"},{\"keyId\":5,\"publicKey\":\"CAUSIQXdmY9uErehJKXqcEOz8ID4uwr62WnYUrIzDSOUZFOwOxogYBro5UNEstirj5AuSPCe2UvmTWhvNhE6UmgcjuiQ7HM=\"},{\"keyId\":6,\"publicKey\":\"CAYSIQU+QRmOx/8u7pbPNOfH/TDhPAQeZwlyPuwUGZ+0E4KUPBog4AeQr4bO/oYI5JEKpQngly8KU0T/ixhYWj3J374/AEI=\"},{\"keyId\":7,\"publicKey\":\"CAcSIQWmn7xQiV3Gkr1Ja1u+9QAJTNGpw/kyk4vekF9/ZXEGHRogMHJJcsVE2A47ikX4YKwCwfZXNlxZirjhrsABhU8nDFU=\"},{\"keyId\":8,\"publicKey\":\"CAgSIQWU+CH1usb9VC+l9HKB2j3mCMtLcqHz1lDvRR/15bR5dhogSLMJCArJNPjc0RGE7dxW4U/5pPgQXfkf29MXWKgPHFc=\"},{\"keyId\":9,\"publicKey\":\"CAkSIQVm9xTISMKG+FU9r+8hdX0CmP1GlqGvIOpP8H0Kc/VzaBogSHtsUeVv6OCvCnsDZTNpjfKTSvgMsBwNzpnKpzVZyGE=\"},{\"keyId\":10,\"publicKey\":\"CAoSIQXBemWkieczXAKYZa/W1Z/Sd9K9MH5Udwzl4qQ8Vn5LfhogwHU8ZM0rJ2LYJKgzoaPv/6HPBq2cKYB7i/ngc43gaF4=\"},{\"keyId\":11,\"publicKey\":\"CAsSIQWqvB3YDVWrc9Q+r5qeqrQWpOhoEHhLyt6omVLDjkbhdBog2CjkcIa8EiETKhFC57FUJyfcYogYW7K85JzvH3BWtGc=\"},{\"keyId\":12,\"publicKey\":\"CAwSIQXdzXK0Q9KCvZMWDT6w5v/bQtfEREZFQYIMGELbBKM5BRogmGGEsxIeaSYS8T97H4bliyt0ToqU4gunxrowH8hsFHM=\"},{\"keyId\":13,\"publicKey\":\"CA0SIQWh6jxWRUHEDWWrRKaGNTzIzNFuQF9wYjATGtOe/6q3Gxog6Hi33jMT1IuetqaBVS98u3NSg9tfwHRPPFIlSSFnN24=\"},{\"keyId\":14,\"publicKey\":\"CA4SIQUvhsjairXESuTAnSDo/82quu+aroOhdeqjmQoUddLQNhogAGTgT3b8kBz/JhQ02SWrqf234SnqadR0WKBL8MK3xVE=\"},{\"keyId\":15,\"publicKey\":\"CA8SIQVaqG/q5pYq3CvZzu4n8tc91JlkGHH0rFr7A7kwWBrTNhog+DBo+dhvn32GwEQ3H25yA6lFgF09PZXQwUsm6zHWl04=\"},{\"keyId\":16,\"publicKey\":\"CBASIQWzTMIm4JlE/qERsXhhFRey0qAnyoP5R+2tvgQe5X9kIxog6G4zKG1SVJVe6i9QDKKy7LCcTUgmvuboXS3p1Aip+2Y=\"},{\"keyId\":17,\"publicKey\":\"CBESIQVlCOGpCxqf8eELL78+tU19muOmFaHPK/NTQMAdSil3SxogwC5gUMGFqp7cvHg2kLWsgPjHAY0GpZns/yb9gAdq60M=\"},{\"keyId\":18,\"publicKey\":\"CBISIQVabvwjTcRl6EErlmOXWS/EKmtGDqsYSKohddckKH+Scxog0OgPeUsG/Ok7qLFErr/1/uoCRooxBTanlwjTLsR+tmE=\"},{\"keyId\":19,\"publicKey\":\"CBMSIQXZubY+Bv4wPCdSv4agMhQ/F5F3u9CKzUsLtYmBoOYPMBogGBdhlaeD/oXC8iP2/Wx2nWngPAgin0xxPfE1SeIklXM=\"},{\"keyId\":20,\"publicKey\":\"CBQSIQXhxibueJ2XPtp7J8DVeWQtwQ1JnwpuGLv9wZ3ieA69Sxog6KOC0iPFqEH2jC11E/dOSpFYmPxqYZxeKcbOrR6GwnI=\"},{\"keyId\":21,\"publicKey\":\"CBUSIQV8acmXIpz8K4USbqERU1QjkuzAseNujHl1ijjxvTBccBogQFLAEiLJwtgmD8sDe9Z6jk5qSIbtc51fI/MWsjQ3Els=\"},{\"keyId\":22,\"publicKey\":\"CBYSIQUGQGU2A0DiVHURPi59nhn4dfHiQQ+/MXMWgtWrNphICBogkAMibeLtqUPKlnPbKCcDJ2F+bmosi+8gfxv5SKvA92s=\"},{\"keyId\":23,\"publicKey\":\"CBcSIQX4+jhDOSFCOo1LxMwPKpz2Vz5hEjZqA6pQ/Q2yoNvSNRogmNkRGIuHc/yWQG2346BP3Q5UIatxwr0ntOnu4AAigHY=\"},{\"keyId\":24,\"publicKey\":\"CBgSIQWMxza+rCWNC9II8w1XIZe/37iKkF0XAUfuqE8TiOTBDBogKAEE+3lcoKtes/JfR1t6L7Z23i4VgnoNdzxfst2aP3o=\"},{\"keyId\":25,\"publicKey\":\"CBkSIQWq3rnXUcuJwoCKi99++PHcGcycg7dTopqNfOb8UtruchoguOSmNoCM8jQkA8WvAUd0CckphEe6MF/UwGoNgWsD3l0=\"},{\"keyId\":26,\"publicKey\":\"CBoSIQWm4Lm0kayxg8DJsL0NxAS2c3FTE86e05vvW9wPfWk0Xhog6GQ908Q22/6R5pyXLrCxtmfK/6XvHtiuJx7ElDdlC00=\"},{\"keyId\":27,\"publicKey\":\"CBsSIQVxhc1a7jgrLAxnoeAJe5/pSphaids8AADBBus5jT62YBog2NKTZE8BHXGUHPleRy8T4Q1dV+Mk1keXYdQzN+eWCFU=\"},{\"keyId\":28,\"publicKey\":\"CBwSIQUJDoK3vGoodxYxLL49aSrEjhtgDIn8F4Y1ABHGMIVPQRogSFbshZnsjBfKhZhTLJxzqOnxTmFxp3N6eabnvWZyHlg=\"},{\"keyId\":29,\"publicKey\":\"CB0SIQWTMz1kp2McHCvIG3GH4iKmcgs375fGyuF2saz+blcbLxogWAgk+xiVMJhsxIZBEUeO5+efCpxmWUcARnL4KkXDuV4=\"},{\"keyId\":30,\"publicKey\":\"CB4SIQXjmMvCgHbZwK0kbaRBE3tQcf8yi/5O6NwskB2t1mFcXRogGPtuixOehX83VXYKYRKlab4f3v4kyzHREc0wh0kqLWY=\"},{\"keyId\":31,\"publicKey\":\"CB8SIQV/QzdrAPvWB3hPZKhKRsjFMa2U8L5LFCWn5/ObynmJEhogONjelPBPxLTObYZGh/mv2sxytmOzEr8aCy9X0hzI80M=\"},{\"keyId\":32,\"publicKey\":\"CCASIQVkBQQSwyP/0RfwEaa9FRpHVTbZl6Srxckt5YOyNqYnBBoggDeCWO70ulekPSvwLPp2CUOH6f76+qjIFDdvGHpXrHA=\"},{\"keyId\":33,\"publicKey\":\"CCESIQWUDF1r/IqLmGLcDhMRbt7SF7P5zYQZuOEY9L05TIQnahogoGF6D/coZBmxcoOI9DA7k4292RImzDnE3BkIur1Kpm8=\"},{\"keyId\":34,\"publicKey\":\"CCISIQXdTfMNpbZZGMRuV9m4quhdpJ/e1r/ALTYEeQoJF0RjcBogAFcNl3j+V1BKIvyZImui1JwuwQvF9rSDrnz7YMrmW2M=\"},{\"keyId\":35,\"publicKey\":\"CCMSIQXfuVjOCudtWIadCeAVT5sU2hvfjfKKcTtbZs3TbMtMLhoguBHubFD3OCUK0ohfzgjJa+aVBjk4JEOPOGmpuVKtukM=\"},{\"keyId\":36,\"publicKey\":\"CCQSIQWvf8UQdmLv5f1tLhB50pMth3DN8eB6nQCb6O65kLVYSxogeN+fmEp0xHn6jwpnGPBrCR4cRQ3j3C4qr0/ft9E5zUA=\"},{\"keyId\":37,\"publicKey\":\"CCUSIQXdqrSNlZpOZMX8aPSTa79GS1NKHtmYYk66owBbTnEqMBoggOhZFMemZIXNc83uix1ZmkhvFR+5Lv0SXJbyh4aAtm8=\"},{\"keyId\":38,\"publicKey\":\"CCYSIQX0yPVZXVcxfP3/E7xpvk6N0ehTmJ4wxE43FiYGmN3VQBogqLz//d3srACfxvZiaThM6XI4kx5Ic7xBFy4RAxB4lm0=\"},{\"keyId\":39,\"publicKey\":\"CCcSIQXM7NAqr/9GtoQN6WKY7Q8wNXxeo9llDVc5pWkbuIwXZBogaBaKK7t56du/HSkppw0z0z8nfkg9QqeauLnsRq4DFG4=\"},{\"keyId\":40,\"publicKey\":\"CCgSIQWsMTiW5V+7dXsYtOj+RH2K+/iMqCeDzpgddq6gPMEDIhog2Gb7m4ACbeCUe8vCj60kr7H2o2m+uNj6x9TLNbATPHk=\"},{\"keyId\":41,\"publicKey\":\"CCkSIQXabIRvAoKS317pfW+BUBEdx83OUNL2be37ZLCAlepdZhog8BFCcBH2/KCkYH6slYQJAvY75uncaajGGj6Ooe3ikFE=\"},{\"keyId\":42,\"publicKey\":\"CCoSIQULEmlg0hML+9UmCGCHn5bxlFctW+ubv8hyGWiKTV5SCRogCK0MiODpRd2NxJmaiBBl737eHZvcC9KIbO2HSt2DQkI=\"},{\"keyId\":43,\"publicKey\":\"CCsSIQV6sqkki6oE06Op+hPvJysqCfTCHTnO7EijNlFaMO2nLRog8DN85Bz0e0UO4Ja1h+Nay++qbnlltEkJUdvUAtqzSnk=\"},{\"keyId\":44,\"publicKey\":\"CCwSIQU+7conw1semKjX3bHJMxcupdaQxsnFagP4W78y9CcUNxogmOW/nKAWhD7/jE02dp7pur8KfLgEEyvvOhfnYImwDH0=\"},{\"keyId\":45,\"publicKey\":\"CC0SIQUE6C3Qt+UtZc7ymvk886K6qtvLhpjx7lr//BLwBVF8EBoguIt9U2Vtjr7mMHli045UjjTzjJVt52mLZ4FZ+zqM90g=\"},{\"keyId\":46,\"publicKey\":\"CC4SIQUcVFXDeXoi1Mewv0ArLNioHGK1v5QVbFYeP3K5ledmeRogqKe9OaciA3+r3jwhINb4A8+qkVKq/WE2C6bqNevlvkk=\"},{\"keyId\":47,\"publicKey\":\"CC8SIQXKQ6hS5NtGUZNx08mFTKX+GN2iZlfjIHZFMoKCX1/OAhoguE5bLy9/2WyBatH7bnqldCQjvIhYfG3hy0St95KXIEE=\"},{\"keyId\":48,\"publicKey\":\"CDASIQU2bgN5AMmLosMZix75vCAN9XuNn8uP6GTEQ+3umDfbNBogCEuOAKM4Xi6wXW1jYLjH+6jFJy30OM0hn0lyG+N/Vnk=\"},{\"keyId\":49,\"publicKey\":\"CDESIQW/njV4M0dyJwntOqXUVyPdK4agoYOotH2uoKbmvKZmLRogwARLd1lZVhiEa4yzjT6OpXJ9jNXuLkKofgQ9JjtVxFc=\"},{\"keyId\":50,\"publicKey\":\"CDISIQVeS3xUkOhJwthYryCiegDvyrBN/RVREVVRcVWba/foExogaEyoLoxQLm1Kku92F5Ko4VvbuVoUgPl115Yyb0uGcW4=\"},{\"keyId\":51,\"publicKey\":\"CDMSIQWZNXiPcLnafIYnmLQEKwsdLKWui+XefdMiQc2AzUuNQRogQMS3YZBfq/dcKrReESt0hXQ1n79YclPehQ/E6n9qwHM=\"},{\"keyId\":52,\"publicKey\":\"CDQSIQU2MW2zh/uZdBd2NBL7YEUZSC0xhJc60J2htNsK1jCcFBogKG7OmNG+aJAerBZmPDSKoQmZFK06k8JP66dZ9+9vD1w=\"},{\"keyId\":53,\"publicKey\":\"CDUSIQUJQ7ItnAXhqoB1icbxR8hf3JeZJgIhDAti9tuq6L5lbhogMESIRAMxNGQ+XIrlTCh4o+FiVEgWNPVJythnzUSpfl0=\"},{\"keyId\":54,\"publicKey\":\"CDYSIQWZ/Xxp4sDbUNZa2BfBsEiy+Aqla3IhUxRyPFbo44DyIBog4MgmR/9gMGTkpZ2JSsexJHHXOkIEU2eWWliFrRbjeFE=\"},{\"keyId\":55,\"publicKey\":\"CDcSIQWQDZUq8RKjWrXTX5jusKWPoRYLyDwUCuROmgFc4vlmRRogUDR/aCRn/kSa+Fe1jQaOk+DUP0eucDf1IhxO73v/dEo=\"},{\"keyId\":56,\"publicKey\":\"CDgSIQWllmXj8cM/DfSgaRoYS0IgXsO96DZO244qf4enf89MIxogCIS3ZlYHlMSMlvK1vUK76GC2CxXVQkgIq8HqYqUhPWI=\"},{\"keyId\":57,\"publicKey\":\"CDkSIQWyDUvNXVbKlpY1RWQhNKfkKOmSQoEB2n5+Y/t5D6ETFRog0NBNm8hsWBx3xjqOmDGhtuJovBkLax4131woJ0qakXc=\"},{\"keyId\":58,\"publicKey\":\"CDoSIQXmnTaBLo073CLJgWlkFisvpPtqmjIo739HT4c2aGr0UhogOLpv2Eutb53ITZuPF87gKMPm/Ga6l1Zvz8k94TQiJkI=\"},{\"keyId\":59,\"publicKey\":\"CDsSIQUuSdMmu+8+vPmrMq5CR/x0JUVI0/xxZ5XoFWN3yutpVxogqFaSbKnycDFYiqCGTv1TPwRlDgI3O4LCA/+PzFev41U=\"},{\"keyId\":60,\"publicKey\":\"CDwSIQUDN4EpJnXHTb6SzcGZpukHa4NGsyXpHikHUsdHB6xMYxogUN0YvYbYfosjb+BSBgpxlI7Aqk0VsKhQfQKGDoON/nk=\"},{\"keyId\":61,\"publicKey\":\"CD0SIQWP14O6XvYTDexMEUR2GMohgHANVEZkjyMgAom5YmNKEBog+JoOsm6MqVcHwu21yNaIUhz436sqYfdXmoJm/I2hmXk=\"},{\"keyId\":62,\"publicKey\":\"CD4SIQU6RQ7ahHwxPGXAO7Zv/+SImspMdNjua/Q7b+VgNhVdOhogeLi5xe33YdezqTTiZvtHr9IskPPfkqZwNpGv1XTBbGM=\"},{\"keyId\":63,\"publicKey\":\"CD8SIQXtaJoH4np5BDmMw3t4l8lcmMHwQ245hdkmcFXhE+ZPChogsAjU08ODeCJ0lCLgBYswD5NRRpWmgUT42BrFi8Tepk0=\"},{\"keyId\":64,\"publicKey\":\"CEASIQW6DLb8V9ucupl+pOOts8AkNGp8Z6zXjP2eNRS4U7g5NBogsA3gKNsrBrdxPIu0wolEKwlAkIkfZbmBmtOEiuvj3kc=\"},{\"keyId\":65,\"publicKey\":\"CEESIQW0tQrzFIY+nn7bhbc3WM/cz0Qini6YS5NZpnhT+rKnWRogoLSNc3VeK6fsLbveQ9dhYfy6OmEKEo7Yj7tfbE1dm1Y=\"},{\"keyId\":66,\"publicKey\":\"CEISIQXlrQASyjczZAxH0wdPWCWvFJ/qrIgXAnZZBWab6jlgDRogyFpbvPxNdHEEl+32ZXEXigodDVi3XxHjWhcFJajx4Eo=\"},{\"keyId\":67,\"publicKey\":\"CEMSIQXZD+SAjmuErJv1e/takiPCmt0texxIzdP+MLzgr969ARogSJ1CXx8Hfkkf3+QnU4LOU1UV2tuKrP3xyM3+nan/9X8=\"},{\"keyId\":68,\"publicKey\":\"CEQSIQUcGI1cO6fzx1Tkkks3OynT0fmtkoStMGk77LoPJRmFSxog2A9sA503lrpZJCCW0AdPbJN670HkfYOrS1L6DYUvOlI=\"},{\"keyId\":69,\"publicKey\":\"CEUSIQWgaVmpJE32ShuglJLd2wd8tNNyjS2n9Xmkt0CzDsoMThog4G1gmZDnaFhfj6FErOS3yAxnxq2Vtw3jU6VhOn4xQWo=\"},{\"keyId\":70,\"publicKey\":\"CEYSIQXQ9cLChyvOSxAHgXyGMDo6MbTRzB0HjobXzJb2cyJlNBogyCke/FyVsZXCxi3ZgbfBygKiwYwvq53KEpEK81NdNFU=\"},{\"keyId\":71,\"publicKey\":\"CEcSIQV5o906LnZ31Wm4/o/M57w2gr1ftEuJ2uir3JuwU5apPBogiCawAGTn7PmVNLVE4ejom0O/b3xR8ito2q5gUY4QCVw=\"},{\"keyId\":72,\"publicKey\":\"CEgSIQX1RtWShUlIThru/LwNvkBESD6yWhT+yyAmmjWePOIaVhogoF4CtfjcNJkitlPeKhdJlrkjtY92ZYzKZ/i0H5oKY2c=\"},{\"keyId\":73,\"publicKey\":\"CEkSIQW9uCZDb7Rviea8ZeTm8HEbegzHWojAl/DvEVKlAGOfOhog8Imbuis6KpAiYXu4p4hoqu78GMaflAPvKYI8mVIprXU=\"},{\"keyId\":74,\"publicKey\":\"CEoSIQXgMulFfp3ePusUcq+E5CQQvHdkQ41HueYF6dAGyFoPURogQPyB1WfHaSgjIYQT8IwX2pDKTIxK7Vv5WMmOwW7fqmI=\"},{\"keyId\":75,\"publicKey\":\"CEsSIQWd53ajB2m02fC0AuAn/kz8EKdxGcrruJwWzp2giAV6IxogaJTzBfYAemguXhuJAngqYeO+zCcfUc/UTwL8qVR+xmE=\"},{\"keyId\":76,\"publicKey\":\"CEwSIQUSkMHIMK4EGGMd0g4AqnIOYrqch1vTnm6kEmz1GTeYMhog8JTVfqDcZBBqSVT2PRRPadYkMrJ63JfK7rbfzbjWh3Q=\"},{\"keyId\":77,\"publicKey\":\"CE0SIQW3wHMwGwTg+iLIF9i8elFTe0OxRnpoQ1q7ifUtgtfYRBogsB/dEcqOl40uck/M7A5LqhThspaiNuL0DW6WOxnslHY=\"},{\"keyId\":78,\"publicKey\":\"CE4SIQVLueLJd3+7ai2ZNQh9GmVPmeA5Xr0M6cqqZC4YaD3/dxogyPH3zsgyw3wozdsKdiPAOaSB63U5YF8NoE2edpyAJkY=\"},{\"keyId\":79,\"publicKey\":\"CE8SIQW4sD6sBmF/keIr/iAjfT2mZMy1oGVS6/qmVmllpAf4aBogyNlY7/IdZdUm2YShXlfddmErIYMTcXtJnOAidmOwB3c=\"},{\"keyId\":80,\"publicKey\":\"CFASIQXov142oQl2o/GZ/YPfDX3tMTedjE8TDq7YqTPZ1BnyAxog4Lg7X5gvB3zBK8xol7FoifJ0Z0QCnR2fD7kCsR7QdmU=\"},{\"keyId\":81,\"publicKey\":\"CFESIQVbJqOmHECWIbz5j/y7nX3W9ot1Eb2k4BZUPSoPaYqCFRoggH7dkLfOdqI7rmbN1z1DMvqNvF848pPTFbFzAgLWDE4=\"},{\"keyId\":82,\"publicKey\":\"CFISIQVrdsrYviBpaLVdgiGDBRF6P45un5bETleTk7HoWNWTUBogWNIcI1mYPHxUPdRRcS93SM8PzgOR6jvMo0grakizrHc=\"},{\"keyId\":83,\"publicKey\":\"CFMSIQUNzQRlFVuWnSFBoLtn/EAnvczHLwW7/i1MykKzsPl4RRogSKeGKadYtZMTWsV46XA69N3RB5a73DSLYfrsam5zDH4=\"},{\"keyId\":84,\"publicKey\":\"CFQSIQWNLbB79yPH/42eS3hr7TLsIF8/LvCPqAqg4jJsc42lahogoBsu0tvwYVWEpehp3ULZ+UeBQqZpG77sImG1lYjyb1s=\"},{\"keyId\":85,\"publicKey\":\"CFUSIQXLpSBF2LMLnPRZCNsVxxvD58LGtnIqGJlkjJil6nJYRBog0DQ50I8eHD1NEI8wZyrXOvZP6WNWFUOOZYKUzCvNrVg=\"},{\"keyId\":86,\"publicKey\":\"CFYSIQXOqeGtgbdM7qt96cl3Mtl/IN0UGH3bgvMzCQDqs+F2VhogsBQsN8eArnFP6faZjm/pXSGGEjADStnF+mF7KqZyr10=\"},{\"keyId\":87,\"publicKey\":\"CFcSIQUtfdNxRrwJneCcowfwXUVrimTkwbxdtFrcKqJSrolAJxogSLDh2ERfdD0+6v2o0gKuZiX49AoVaGzEz+qRoQv6gUI=\"},{\"keyId\":88,\"publicKey\":\"CFgSIQX+VMYjJuvLTEJoLO8XCPeVcpdoLDHohHmxnuJXiPWtVhogkCEx4j9SLl9CAKrHMprei/y5AlCsRjk2EvHjW+Cui1M=\"},{\"keyId\":89,\"publicKey\":\"CFkSIQVVsQlT8YSQ85ZDjWmUGqKkX06Ic/2NlUPuy12eswTRVxogwHfkZvvKepcjrcxXAOjn0fnujXJqbOgDiUjqcKhhkVc=\"},{\"keyId\":90,\"publicKey\":\"CFoSIQVimMys7sZKzeV1A2DpWDt0GvJcBhinAcZX2lYNPrftQRogsFMnHaY9vC8AtmnTbAD5fHGUTJ3q2yNvfoH03fBGX30=\"},{\"keyId\":91,\"publicKey\":\"CFsSIQWXe5jBcK5D661Lk5glF6vWNSqSiuXPpt1x83KF7IbmCRogCCkv4rJMGDSLoTFrgQOqOtif7l0gSG20aHFl9UpCN2U=\"},{\"keyId\":92,\"publicKey\":\"CFwSIQXqiU80ugWzlw3f/0YacqL/rPATpqsADslB7ZMabfmvQBogcDjdKFmddFHpj2EeSUYmDxgWsenlN18CxLLCxY3XhEg=\"},{\"keyId\":93,\"publicKey\":\"CF0SIQXuTKPvlXbpALUPD8i8FRZCq7arzhgSgmuRzsbJxpLNIhog6LkS4k8TrfQTNcPP6fnrPjDeOriG7sPssDw+uVmS4F4=\"},{\"keyId\":94,\"publicKey\":\"CF4SIQXefiKkCDKCNAJb8xjg0nAj9pLv3x175iSixJ1c2msdZBog8KFIR9auJ/HACQxxCUF1gze/kwl62G4ijVdwReLq3UU=\"},{\"keyId\":95,\"publicKey\":\"CF8SIQXRaahKOPuJExXT1UxeH9qEjsE8Fjf9d6ywh63lwvEoYhogaNNXcXv9f5oft6WEdCS6bJPvBY6Af7xaPtuDgN1WIV0=\"},{\"keyId\":96,\"publicKey\":\"CGASIQXyhq9Evbb3AKm/PFw4gBWgT7sJBMydGX8Y/IGa/qs5SxogILo0JkZUBYfhDm3WHPlZyjzmqV7FJtEADzstPZpwfFY=\"},{\"keyId\":97,\"publicKey\":\"CGESIQXngHrMhwMW75SQTXGHN93zxxa/UGnA4uw4RZqRrECTLRogSClzro7yUzdmtnbHbfi5nEU7LMaSwPoAoQS3St/HYHU=\"},{\"keyId\":98,\"publicKey\":\"CGISIQUYCwnFcRmlD8ZgagG2eLLEr7pQgGiCGJgQGfPGnXQCHRogELHhiYPjR0XSHcYMdXT0cc6tNDfgJ7AkytCieuO5GmM=\"},{\"keyId\":99,\"publicKey\":\"CGMSIQWFyEKj1h0+J2rHYguRc/vnC+ztk/PMjPjACuS85RfvSxog8KYwjCaUs7gS8AWhDSmBpwnFCwOQshSXQDRtn60NT0w=\"}],\"registrationId\":1715422480,\"signalingKey\":\"bb44dbb0c6a67ba66667e8a2d6810c7f3723436bd4377fa02470cce4c06ee8f04d40e958c16a01f969215ec34d4fae13169d29d9\",\"signedPreKey\":{\"keyId\":0,\"publicKey\":\"CAASIQUIia6Pupgs1zcJ2zXN5LtjfrSqIS6yLV+L3wbRiIMgQxoggIRe0ayB3o7GWQl6KpRkjOhNDJj/EIVdFx18oYP58GoiQPn8FOPGcGIeVUIGaCV56F7v3CWGW80twgGTWboqMb7sFjzYj3rcMNv8+3QjsVgvVWcBGMkEZt7w8dmC3qcKEIQpZSni4lgBAAA=\",\"signature\":\"+fwU48ZwYh5VQgZoJXnoXu/cJYZbzS3CAZNZuioxvuwWPNiPetww2/z7dCOxWC9VZwEYyQRm3vDx2YLepwoQhA==\"},\"timestamp\":1481275222}")
    }
}
