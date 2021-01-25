# URL-SHORTENER
Hey! Say hi to a small test application that basically takes your URL and makes an ugly shortened version. :)

## HOW TO USE
* Please, build docker image:
```
docker build -t rails-shortener .
```
* And if everything is good to go run container:
```
docker run -p 3000:3000 rails-shortener
```
* Or just `bundle` and `rails s` it.
I hope everything will go smoothly. If not, please let me know.

## REQUESTS EXAMPLES 
* `POST` your awesome URL like this:
```
curl --request POST 'localhost:3000/api/link' --header 'Content-Type: application/json'  -d '{ "url": "http://www.farmdrop.com" }'
```
* `GET` your new ugly little buddy and BE REDIRECTED!

## TECHNOLOGIES
* Ruby version 2.7.0
* Rails version 6.0.3.4
* Bundler -v 2.1.4

## WHAT IS DONE
* Business logic. It works. I hope.
* Dockerization.
* Some tests, but not enough (see below).

## UNFINISHED BUSINESS
* Frontend. Just wouldn't manage to get it done in time.
* Test coverage is, well, silly. Only **validations** on the Link model and some **request tests** are done. Although simplecov will ensure you that the app is 96% covered with tests, well, it's still far from being perfect.

Hopefully, I covered all the basics of the app. Have a good one, and let me know if, well, if anything. I like good company. :)
